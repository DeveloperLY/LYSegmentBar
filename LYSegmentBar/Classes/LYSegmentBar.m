//
//  LYSegmentBar.m
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/4.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYSegmentBar.h"
#import <LYXiMaLaYaFMBase/UIView+LYAdjustFrame.h>

#define kMinMargin 30.0f

@interface LYSegmentBar ()

@property (nonatomic, weak) UIScrollView *contentView;

@property (nonatomic, strong) NSMutableArray <UIButton *> *titleButtons;

/** 下标视图 */
@property (nonatomic, weak) UIView *underLine;

/** 选中的TitleButton */
@property (nonatomic, strong) UIButton *selectedButton;

@end

@implementation LYSegmentBar

#pragma mark - Life Cycle
+ (instancetype)segmentBarWithFrame:(CGRect)frame {
    LYSegmentBar *segmentBar = [[LYSegmentBar alloc] initWithFrame:frame];
    return segmentBar;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
    
    // 计算margin
    CGFloat totalButtonWidth = 0.0f;
    for (UIButton *titleButton in self.titleButtons) {
        [titleButton sizeToFit];
        totalButtonWidth += titleButton.ly_width;
    }
    
    CGFloat caculateMargin = (self.ly_width - totalButtonWidth) / (self.titleArray.count + 1);
    if (caculateMargin < kMinMargin) {
        caculateMargin = kMinMargin;
    }
    
    CGFloat lastX = caculateMargin;
    for (UIButton *titleButton in self.titleButtons) {
        [titleButton sizeToFit];
        titleButton.ly_y = 0.0f;
        titleButton.ly_x = lastX;
        lastX += titleButton.ly_width + caculateMargin;
    }
    
    self.contentView.contentSize = CGSizeMake(lastX, 0.0f);
    
    if (self.titleButtons.count == 0) {
        return;
    }
    
    UIButton *selectedButton = self.titleButtons[self.selectedIndex];
    self.underLine.ly_width = selectedButton.ly_width;
    self.underLine.ly_centerX = selectedButton.ly_centerX;
    self.underLine.ly_y = self.ly_height - self.underLine.ly_height;
}

#pragma mark - Event/Touch
- (void)titleButtonDidTouch:(UIButton *)sender {
    if (self.selectedButton == sender) {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:fromIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:sender.tag fromIndex:self.selectedButton.tag];
    }
    
    _selectedIndex = sender.tag;
    
    self.selectedButton.selected = NO;
    sender.selected = YES;
    self.selectedButton = sender;
    
    // 设置下标指示器的位置
    [UIView animateWithDuration:0.15f animations:^{
        self.underLine.ly_width = sender.ly_width;
        self.underLine.ly_centerX = sender.ly_centerX;
    }];
    
    // 选中居中
    CGFloat offsetX = sender.ly_centerX - self.contentView.ly_width * 0.50f;
    if (offsetX < 0) {
        offsetX = 0;
    }
    CGFloat offsetWidth = self.contentView.contentSize.width - self.contentView.ly_width;
    if (offsetX > offsetWidth) {
        offsetX = offsetWidth;
    }
    
    [self.contentView setContentOffset:CGPointMake(offsetX, 0.0f) animated:YES];
}

#pragma mark - Setter And Getter
- (void)setTitleArray:(NSArray<NSString *> *)titleArray {
    _titleArray = titleArray;
    
    // 删除之前添加的所有子控件
    [self.titleButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.titleButtons = nil;
    
    // 根据传进来的数据源，创建titleButton
    for (NSString *title in titleArray) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = self.titleButtons.count;
        [titleButton setTitle:title forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [titleButton addTarget:self action:@selector(titleButtonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
    }
    
    // 当数据源改变时，必须强制刷新布局
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    // 过滤非法数据
    if (self.titleButtons.count == 0 || selectedIndex < 0 || selectedIndex > self.titleButtons.count - 1) {
        return;
    }
    _selectedIndex = selectedIndex;
    
    UIButton *selectButton = self.titleButtons[selectedIndex];
    [self titleButtonDidTouch:selectButton];
}


- (NSMutableArray<UIButton *> *)titleButtons {
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (UIView *)underLine {
    if (!_underLine) {
        UIView *underLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.ly_height - 2.0f, 0, 2.0f)];
        underLineView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:underLineView];
        _underLine = underLineView;
    }
    return _underLine;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        _contentView = scrollView;
    }
    return _contentView;
}

@end
