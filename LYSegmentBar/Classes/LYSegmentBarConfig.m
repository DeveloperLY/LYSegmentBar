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

- (LYSegmentBarConfig *(^)(UIColor *))segmentBarBackColorBlock {
    return ^(UIColor *color) {
        self.segmentBarBackColor = color;
        return self;
    };
}

- (LYSegmentBarConfig *(^)(UIFont *))titleFontBlock {
    return ^(UIFont *font) {
        self.titleFont = font;
        return self;
    };
}

- (LYSegmentBarConfig *(^)(UIColor *))titleNormalColorBlock {
    return ^(UIColor *color) {
        self.titleNormalColor = color;
        return self;
    };
}

- (LYSegmentBarConfig *(^)(UIColor *))titleSelectColorBlock {
    return ^(UIColor *color) {
        self.titleSelectColor = color;
        return self;
    };
}

- (LYSegmentBarConfig *(^)(UIColor *))underLineColorBlock {
    return ^(UIColor *color) {
        self.underLineColor = color;
        return self;
    };
}

- (LYSegmentBarConfig *(^)(CGFloat))underLineHeightBlock {
    return ^(CGFloat underLineHeight) {
        self.underLineHeight = underLineHeight;
        return self;
    };
}

- (LYSegmentBarConfig *(^)(CGFloat))underLineExtraWidthBlock {
    return ^(CGFloat underLineExtraWidth) {
        self.underLineExtraWidth = underLineExtraWidth;
        return self;
    };
}

@end
