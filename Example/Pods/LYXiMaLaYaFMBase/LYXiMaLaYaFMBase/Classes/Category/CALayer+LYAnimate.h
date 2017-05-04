//
//  CALayer+LYAnimate.h
//  LYXiMaLaYaFMBase
//
//  Created by LiuY on 2017/4/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (LYAimate)

/**
 *  暂停动画
 */
- (void)pauseAnimate;

/**
 *  恢复暂停动画
 */
- (void)resumeAnimate;

@end
