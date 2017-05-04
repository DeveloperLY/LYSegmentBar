//
//  LYSegmentBar.h
//  LYSegmentBar
//
//  Created by LiuY on 2017/5/4.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYSegmentBar : UIView

+ (instancetype)segmentBarWithFrame:(CGRect)frame;

@property (nonatomic, strong) NSArray<NSString *> *titleArray;

@end
