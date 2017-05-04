//
//  CALayer+LYAnimate.m
//  LYXiMaLaYaFMBase
//
//  Created by LiuY on 2017/4/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "CALayer+LYAnimate.h"

@implementation CALayer (LYAnimate)

- (void)pauseAnimate {
    CFTimeInterval pausedTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.speed = 0.0;
    self.timeOffset = pausedTime;
}

- (void)resumeAnimate {
    CFTimeInterval pausedTime = [self timeOffset];
    self.speed = 1.0;
    self.timeOffset = 0.0;
    self.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.beginTime = timeSincePause;
}

@end
