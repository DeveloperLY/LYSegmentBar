//
//  UIImage+LYAdd.m
//  LYXiMaLaYaFMBase
//
//  Created by LiuY on 2017/4/25.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//

#import "UIImage+LYAdd.h"

@implementation UIImage (LYAdd)

+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (UIImage *)imageCircleTailorWithImage:(UIImage *)image {
    // 获取位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    // 设置裁剪路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    // 裁剪
    [path addClip];
    
    // 将图片绘制到位图上下文中
    [image drawAtPoint:CGPointZero];
    
    // 从位图上下文中输出新图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭位图上下文
    UIGraphicsEndImageContext();
    
    // 返回裁剪成功
    return newImage;
}

- (UIImage *)imageAntialias {
    CGFloat border = 1.0f;
    CGRect rect = CGRectMake(border, border, self.size.width - 2 * border, self.size.height - 2 * border);
    
    UIImage *img = nil;
    
    UIGraphicsBeginImageContext(CGSizeMake(rect.size.width, rect.size.height));
    [self drawInRect:CGRectMake(-1, -1, self.size.width, self.size.height)];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.size);
    [img drawInRect:rect];
    UIImage* antiImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return antiImage;
}

+ (UIImage *)resizeImage:(NSString *)imageName {
    return [[UIImage imageNamed:imageName] resizeImage];
}

- (UIImage *)resizeImage {
    CGFloat width = self.size.width * 0.5;
    CGFloat height = self.size.height * 0.5;
    return [self stretchableImageWithLeftCapWidth:width topCapHeight:height];
}

+ (UIImage *)imageWithBorderW:(CGFloat)borderW corlor:(UIColor *)color Image:(UIImage *)image {
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW , borderW, image.size.width, image.size.height)];
    [clipPath addClip];
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

// 压缩图片
- (UIImage *)scaleToSize:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    // Determine whether the screen is retina
    if ([[UIScreen mainScreen] scale] == 2.0) {
        UIGraphicsBeginImageContextWithOptions(size, NO, 2.0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

- (UIImage *)createNewImageWithText:(NSString *)string {
    // 获取位图上下文
    UIGraphicsBeginImageContext(self.size);
    // 绘制源图片
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    // 绘制文字
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:25],
                           NSParagraphStyleAttributeName :  style
                           
                           };
    [string drawInRect:CGRectMake(0, self.size.height - 100, self.size.width, 50) withAttributes:dict];
    
    // 生成一张新图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)composeNewImage {
    CGFloat w = CGImageGetWidth(self.CGImage);
    CGFloat h = CGImageGetHeight(self.CGImage);
    // 拿到边框
    UIImage *borderImage = [UIImage imageNamed:@"share_image_border"];
    
    // 以传入的图大小为画布创建上下文
    UIGraphicsBeginImageContext(CGSizeMake(w, h));
    [self drawInRect:CGRectMake(0, 0, w, h)]; // 先把self 画到上下文中
    [borderImage drawInRect:CGRectMake(0, 0, w, h)]; // 再把borderImage放在上下文中
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext(); // 从当前上下文中获得最终图片
    UIGraphicsEndImageContext(); // 关闭上下文
    return resultImage;
}

+ (UIImage *)getImageWithSize:(CGRect)myImageRect fromImage:(UIImage *)bigImage {
    // 大图bigImage
    // 定义myImageRect，截图的区域
    CGImageRef imageRef = bigImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size;
    size.width = CGRectGetWidth(myImageRect);
    size.height = CGRectGetHeight(myImageRect);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    CGImageRelease(subImageRef);
    UIGraphicsEndImageContext();
    return smallImage;
}

- (UIImage *)getImageWithRatio:(CGFloat)ratio {
    CGRect rect;
    rect.size.width = self.size.width;
    rect.size.height = self.size.width / ratio;
    rect.origin.x = 0;
    rect.origin.y = (self.size.height - rect.size.height) / 2.0;
    return [UIImage getImageWithSize:rect fromImage:self];
}

@end
