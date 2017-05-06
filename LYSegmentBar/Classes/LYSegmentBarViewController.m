//
//  LYSegmentBarViewController.m
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/6.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYSegmentBarViewController.h"
#import <LYXiMaLaYaFMBase/UIView+LYAdjustFrame.h>

@interface LYSegmentBarViewController () <LYSegmentBarDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *contentView;

@end

@implementation LYSegmentBarViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (self.segmentBar.superview == self.view) {
        self.segmentBar.frame = CGRectMake(0, 60.0f, self.view.ly_width, 35.0f);
        CGFloat contentViewY = self.segmentBar.ly_y + self.segmentBar.ly_height;
        self.contentView.frame = CGRectMake(0, contentViewY, self.view.ly_width, self.view.ly_height - contentViewY);
        self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.ly_width, 0);
        return;
    }
    
    self.contentView.frame = CGRectMake(0, 0, self.view.ly_width, self.view.ly_height);
    self.contentView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.ly_width, 0);
}

#pragma mark - Public Method
- (void)setUpWithTitleArray:(NSArray<NSString *> *)titleArray childViewControllers:(NSArray<UIViewController *> *)childViewControllers {
    NSAssert(titleArray.count != 0 && titleArray.count == childViewControllers.count, @"标题和子控制器的个数必须一致且大于0");
    self.segmentBar.titleArray = titleArray;
    
    // 移除的所有控制器
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    // 添加子控制器
    for (UIViewController *viewController in childViewControllers) {
        [self addChildViewController:viewController];
    }
    
    self.contentView.contentSize = CGSizeMake(titleArray.count * self.view.ly_width, 0);
    self.segmentBar.selectedIndex = 0;
}

#pragma mark - Private Method
- (void)showChildViewControllerAtIndex:(NSInteger)index {
    if (self.childViewControllers.count == 0  || index < 0 || index > self.childViewControllers.count - 1) {
        return;
    }
    
    UIViewController *viewController = self.childViewControllers[index];
    viewController.view.frame = CGRectMake(index * self.contentView.ly_width, 0, self.contentView.ly_width, self.contentView.ly_height);
    [self.contentView addSubview:viewController.view];
    
    [self.contentView setContentOffset:CGPointMake(index * self.contentView.ly_width, 0) animated:NO];
}

#pragma mark - LYSegmentBarDelegate
- (void)segmentBar:(LYSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex {
    [self showChildViewControllerAtIndex:toIndex];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 计算最后的索引值
    NSInteger index = self.contentView.contentOffset.x / self.contentView.ly_width;
    
    // 指定当前标题
    self.segmentBar.selectedIndex = index;
}

#pragma mark - Setter And Getter
- (LYSegmentBar *)segmentBar {
    if (!_segmentBar) {
        LYSegmentBar *segmentBar = [LYSegmentBar segmentBarWithFrame:CGRectZero];
        segmentBar.delegate = self;
        [self.view addSubview:segmentBar];
        _segmentBar = segmentBar;
    }
    return _segmentBar;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        UIScrollView *contentView = [[UIScrollView alloc] init];
        contentView.showsVerticalScrollIndicator = NO;
        contentView.showsHorizontalScrollIndicator = NO;
        contentView.delegate = self;
        contentView.pagingEnabled = YES;
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}

@end
