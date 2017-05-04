//
//  UIImage+LYAdd.h
//  LYXiMaLaYaFMBase
//
//  Created by LiuY on 2017/4/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LYAdd)

/**
 *  加载最原始的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 返回最原始图片
 */
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

/**
 *  根据颜色生成图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  将图片裁剪成圆形
 *
 *  @param image 需要裁剪的图片
 *
 *  @return 裁剪完成的圆形图片
 */
+ (UIImage *)imageCircleTailorWithImage:(UIImage *)image;


/**
 *  返回一张抗锯齿图片
 *
 *  @return 没有锯齿的图片
 *  本质：在图片生成一个透明为1的像素边框
 */
- (UIImage *)imageAntialias;

/**
 *  返回拉伸好的图片
 *
 *  @param imageName 图片名称
 *
 *  @return 拉伸好的图片
 */
+ (UIImage *)resizeImage:(NSString *)imageName;

/**
 *  裁剪带边框的圆形图片
 *
 *  @param borderW 边框宽度
 *  @param color   边框颜色
 *  @param image   待裁剪的图片
 *
 *  @return <#return value description#>
 */
+ (UIImage *)imageWithBorderW:(CGFloat)borderW corlor:(UIColor *)color Image:(UIImage *)image;

/**
 *  压缩图片
 *
 *  @param size   需要压缩的图片大小
 *
 *  @return 压缩后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;

/**
 *  将文字绘制到图片上去
 *
 *  @param string 需要绘制的文字
 *
 *  @return 已经绘制好文字的图片
 */
- (UIImage *)createNewImageWithText:(NSString *)string;

/**
 *  合成两张图片
 *
 *  @return 合成后的图片
 */
- (UIImage *)composeNewImage;

/**
 *  截图
 *
 *  @param myImageRect 指定截取区域
 *  @param bigImage    需要截取的图片
 *
 *  @return 截图
 */
+ (UIImage *)getImageWithSize:(CGRect)myImageRect fromImage:(UIImage *)bigImage;

// 根据比例获取特定的图片
- (UIImage *)getImageWithRatio:(CGFloat)ratio;

@end
