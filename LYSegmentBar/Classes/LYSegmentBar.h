//
//  LYSegmentBar.h
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/4.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYSegmentBarConfig.h"

@class LYSegmentBar;

@protocol LYSegmentBarDelegate <NSObject>

@optional
- (void)segmentBar:(LYSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex;

@end

@interface LYSegmentBar : UIView

+ (instancetype)segmentBarWithFrame:(CGRect)frame;

@property (nonatomic, strong) NSArray<NSString *> *titleArray;

/** 代理 */
@property (nonatomic, weak) id<LYSegmentBarDelegate> delegate;

/** 选中的下标 */
@property (nonatomic, assign) NSInteger selectedIndex;

- (void)updateWithConfig:(void(^)(LYSegmentBarConfig *config))configBlock;

@end
