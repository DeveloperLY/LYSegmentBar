//
//  LYViewController.m
//  LYSegmentBar
//
//  Created by DeveloperLY on 05/03/2017.
//  Copyright (c) 2017 DeveloperLY. All rights reserved.
//

#import "LYViewController.h"
#import "LYSegmentBar.h"
#import <LYXiMaLaYaFMBase/UIView+LYAdjustFrame.h>

@interface LYViewController () <LYSegmentBarDelegate>

@end

@implementation LYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LYSegmentBar *segmentBar = [LYSegmentBar segmentBarWithFrame:CGRectMake(0, 20.0f, self.view.ly_width, 35.0f)];
    segmentBar.backgroundColor = [UIColor brownColor];
    [self.view addSubview:segmentBar];
    segmentBar.titleArray = @[@"推荐", @"热门", @"分类", @"榜单", @"主播"];
    
    // 测试改变数据源，强制刷新布局
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        segmentBar.titleArray = @[@"推荐", @"热门", @"分类", @"榜单", @"主播", @"热门", @"分类", @"榜单", @"主播"];
    });
    
    segmentBar.delegate = self;
}

- (void)segmentBar:(LYSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex {
    NSLog(@"toIndex:->%zd----fromIndex:->%zd", toIndex, fromIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
