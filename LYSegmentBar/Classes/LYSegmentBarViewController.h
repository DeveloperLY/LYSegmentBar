//
//  LYSegmentBarViewController.h
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/6.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYSegmentBar.h"

@interface LYSegmentBarViewController : UIViewController

@property (nonatomic, weak) LYSegmentBar *segmentBar;

- (void)setUpWithTitleArray:(NSArray <NSString *> *)titleArray childViewControllers:(NSArray <UIViewController *> *)childViewControllers;

@end
