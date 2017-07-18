//
//  UIImage+Color.h
//  TalentPool
//
//  Created by MacOS on 17/2/17.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)


/**
 根据颜色生成纯色图片

 @param color 颜色

 @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


/**
 获取图片中某一点的颜色

 @param point 某一点

 @return 颜色
 */
- (UIColor *)colorAtPoint:(CGPoint)point;



/**
 获取某一像素的颜色

 @param point 一像素

 @return 颜色
 */
- (UIColor *)colorAtPixel:(CGPoint)point;


/**
 返回该图片是否有透明度通道

 @return 是否有透明通道
 */
- (BOOL)hasAlphaChannal;


/**
 获得灰图片

 @param sourseImage 图片

 @return 灰图片
 */
+(UIImage *)covertToGrayImageFromImage:(UIImage *)sourseImage;

@end
