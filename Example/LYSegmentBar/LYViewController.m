//
//  LYViewController.m
//  LYSegmentBar
//
//  Created by DeveloperLY on 05/03/2017.
//  Copyright (c) 2017 DeveloperLY. All rights reserved.
//

#import "LYViewController.h"
#import "LYSegmentBarViewController.h"
#import <LYXiMaLaYaFMBase/UIView+LYAdjustFrame.h>

@interface LYViewController ()

/** <#description#> */
@property (nonatomic, strong) LYSegmentBarViewController *segmentBarViewController;

@end

@implementation LYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.segmentBarViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentBarViewController.view];
    
    
    // @[@"推荐", @"热门", @"分类", @"榜单", @"主播"]
    // 创建对应的子控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor redColor];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor lightGrayColor];
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = [UIColor greenColor];
    
    [self.segmentBarViewController setUpWithTitleArray: @[@"推荐", @"热门", @"分类", @"榜单", @"主播"] childViewControllers:@[vc1, vc2, vc3, vc4, vc5]];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        vc5.view.backgroundColor = [UIColor greenColor];
        
        UIViewController *vc6 = [[UIViewController alloc] init];
        vc6.view.backgroundColor = [UIColor redColor];
        
        UIViewController *vc7 = [[UIViewController alloc] init];
        vc7.view.backgroundColor = [UIColor blueColor];
        
        UIViewController *vc8 = [[UIViewController alloc] init];
        vc8.view.backgroundColor = [UIColor brownColor];
        
        UIViewController *vc9 = [[UIViewController alloc] init];
        vc9.view.backgroundColor = [UIColor lightGrayColor];
        
        UIViewController *vc10 = [[UIViewController alloc] init];
        vc10.view.backgroundColor = [UIColor greenColor];
        
        self.segmentBarViewController.segmentBar.frame = CGRectMake(0, 0, 300.0f, 35.0f);
        self.navigationItem.titleView = self.segmentBarViewController.segmentBar;
        [self.segmentBarViewController setUpWithTitleArray: @[@"推荐", @"热门", @"分类", @"榜单", @"主播", @"推荐", @"热门", @"分类", @"榜单", @"主播"] childViewControllers:@[vc1, vc2, vc3, vc4, vc5, vc6, vc7, vc8, vc9, vc10]];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LYSegmentBarViewController *)segmentBarViewController {
    if (!_segmentBarViewController) {
        LYSegmentBarViewController *segmentBarViewController = [[LYSegmentBarViewController alloc] init];
        [self addChildViewController:segmentBarViewController];
        _segmentBarViewController = segmentBarViewController;
    }
    return _segmentBarViewController;
}

@end
