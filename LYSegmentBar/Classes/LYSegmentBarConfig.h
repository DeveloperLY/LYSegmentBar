//
//  LYSegmentBarConfig.h
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/6.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYSegmentBarConfig : NSObject

+ (instancetype)defaultConfig;

/** segmentBar 背景色 */
@property (nonatomic, strong) UIColor *segmentBarBackColor;

/** title 普通状态颜色 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/** title 选中状态颜色 */
@property (nonatomic, strong) UIColor *titleSelectColor;

/** title 字体 */
@property (nonatomic, strong) UIFont *titleFont;

/** 下标指示器颜色 */
@property (nonatomic, strong) UIColor *underLineColor;

/** 下标指示器高度 */
@property (nonatomic, assign) CGFloat underLineHeight;

/** 下标指示器额外宽度 */
@property (nonatomic, assign) CGFloat underLineExtraWidth;


/** segmentBar 背景色 */
- (LYSegmentBarConfig *(^)(UIColor *))segmentBarBackColorBlock;

/** title 普通状态颜色 */
- (LYSegmentBarConfig *(^)(UIColor *))titleNormalColorBlock;

/** title 选中状态颜色 */
- (LYSegmentBarConfig *(^)(UIColor *))titleSelectColorBlock;

/** title 字体 */
- (LYSegmentBarConfig *(^)(UIFont *))titleFontBlock;

/** 下标指示器颜色 */
- (LYSegmentBarConfig *(^)(UIColor *))underLineColorBlock;

/** 下标指示器高度 */
- (LYSegmentBarConfig *(^)(CGFloat))underLineHeightBlock;

/** 下标指示器额外宽度 */
- (LYSegmentBarConfig *(^)(CGFloat))underLineExtraWidthBlock;

@end
