//
//  LYSegmentBarConfig.m
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/6.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYSegmentBarConfig.h"

@implementation LYSegmentBarConfig

+ (instancetype)defaultConfig {
    LYSegmentBarConfig *config = [[LYSegmentBarConfig alloc] init];
    config.segmentBarBackColor = [UIColor clearColor];
    config.titleFont = [UIFont systemFontOfSize:16.0f];
    config.titleNormalColor = [UIColor blackColor];
    config.titleSelectColor = [UIColor redColor];
    
    config.underLineColor = [UIColor redColor];
    config.underLineHeight = 2.0f;
    config.underLineExtraWidth = 10.0f;
    
    return config;
}

@end
