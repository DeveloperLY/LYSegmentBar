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

/** 间距 */
@property (nonatomic, assign) CGFloat margin;

@end

@implementation LYSegmentBar

#pragma mark - Life Cycle
+ (instancetype)segmentBarWithFrame:(CGRect)frame {
    LYSegmentBar *segmentBar = [[LYSegmentBar alloc] initWithFrame:frame];
    
    // 添加滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.showsHorizontalScrollIndicator = NO;
    [segmentBar addSubview:scrollView];
    segmentBar.contentView = scrollView;
    
    return segmentBar;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = self.bounds;
    
    [self setUpTitleButtonFrame];
    
}

#pragma mark - Private Method
- (void)setUpTitleButtonFrame {
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
        [titleButton setTitle:title forState:UIControlStateNormal];
        [self.contentView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
    }
    
    // 当数据源改变时，必须强制刷新布局
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


- (NSMutableArray<UIButton *> *)titleButtons {
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

@end
