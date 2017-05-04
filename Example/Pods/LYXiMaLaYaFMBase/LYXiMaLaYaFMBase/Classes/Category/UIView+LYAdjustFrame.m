//
//  UIView+LYAdjustFrame.m
//  LYXiMaLaYaFMBase
//
//  Created by LiuY on 2017/4/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "UIView+LYAdjustFrame.h"

@implementation UIView (LYAdjustFrame)

#pragma mark - setter
- (void)setLy_centerX:(CGFloat)ly_centerX  {
    CGPoint center = self.center;
    center.x = ly_centerX;
    self.center = center;
}

- (void)setLy_centerY:(CGFloat)ly_centerY {
    CGPoint center = self.center;
    center.y = ly_centerY;
    self.center = center;
}

- (void)setLy_x:(CGFloat)ly_x {
    CGRect tempFrame = self.frame;
    tempFrame.origin.x = ly_x;
    self.frame = tempFrame;
}

- (void)setLy_y:(CGFloat)ly_y {
    CGRect tempFrame = self.frame;
    tempFrame.origin.y = ly_y;
    self.frame = tempFrame;
}

- (void)setLy_width:(CGFloat)ly_width {
    CGRect tempFrame = self.frame;
    tempFrame.size.width = ly_width;
    self.frame = tempFrame;
}

- (void)setLy_height:(CGFloat)ly_height {
    CGRect tempFrame = self.frame;
    tempFrame.size.height = ly_height;
    self.frame = tempFrame;
}

- (void)setLy_size:(CGSize)ly_size {
    CGRect tempFrame = self.frame;
    tempFrame.size = ly_size;
    self.frame = tempFrame;
}

- (void)setLy_origin:(CGPoint)ly_origin {
    CGRect tempFrame = self.frame;
    tempFrame.origin = ly_origin;
    self.frame = tempFrame;
}


#pragma mark - getter
- (CGFloat)ly_centerX {
    return self.center.x;
}

- (CGFloat)ly_centerY {
    return self.center.y;
}

- (CGFloat)ly_x {
    return self.frame.origin.x;
}

- (CGFloat)ly_y {
    return self.frame.origin.y;
}

- (CGFloat)ly_width {
    return self.frame.size.width;
}

- (CGFloat)ly_height {
    return self.frame.size.height;
}

- (CGSize)ly_size {
    return self.frame.size;
}

- (CGPoint)ly_origin {
    return self.frame.origin;
}

@end
