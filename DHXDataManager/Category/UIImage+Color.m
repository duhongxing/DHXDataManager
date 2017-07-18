//
//  UIImage+Color.m
//  TalentPool
//
//  Created by MacOS on 17/2/17.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

/**
 根据颜色生成纯色图片

 @param color 颜色

 @return 纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}


- (UIColor *)colorAtPixel:(CGPoint)point{

    if (point.x < 0 || point.y < 0) return nil;

    CGImageRef imageRef = self.CGImage;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);

    if (point.x >= width || point.y >=height) {
        return nil;
    }

    unsigned char *rawData = malloc(height * width *4);
    if (!rawData) {
        return nil;
    }

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast|kCGBitmapByteOrder32Big);

    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);

    int byteIndex = (bytesPerRow * point.y) + point.x *bytesPerPixel;
    CGFloat red = (rawData[byteIndex] * 1.0)/255.0;
    CGFloat green = (rawData[byteIndex + 1] *1.0)/255.0;
    CGFloat blue = (rawData[byteIndex + 2] *1.0)/255.0;
    CGFloat alpha = (rawData[byteIndex + 3] * 1.0)/255.0;

    UIColor *result = nil;
    result = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    free(rawData);

    return result;

}

- (UIColor *)colorAtPoint:(CGPoint)point{

    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }

    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = {0,0,0,0};
    CGContextRef context = CGBitmapContextCreate(pixelData, 1, 1, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast|kCGBitmapByteOrder32Big);

    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);

    CGContextTranslateCTM(context, -pointX, pointY - (CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f,(CGFloat)width,(CGFloat)height),cgImage);
    CGContextRelease(context);

    CGFloat red = (CGFloat)pixelData[0] /255.0f;
    CGFloat green = (CGFloat)pixelData[1] /255.0f;
    CGFloat blue = (CGFloat)pixelData[2] /255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] /255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//是否有透明度通道
- (BOOL)hasAlphaChannal{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst||
            alpha == kCGImageAlphaLast||
            alpha == kCGImageAlphaPremultipliedFirst||
            alpha == kCGImageAlphaPremultipliedLast);
}

//获取灰度图片

+ (UIImage *)covertToGrayImageFromImage:(UIImage *)sourseImage{
    int width = sourseImage.size.width;
    int height = sourseImage.size.height;

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, kCGImageAlphaNone);
    CGColorSpaceRelease(colorSpace);

    if (context == NULL) {
        return nil;
    }

    CGContextDrawImage(context, CGRectMake(0, 0, width, height), sourseImage.CGImage);
    CGImageRef contextRef = CGBitmapContextCreateImage(context);
    UIImage *grayImage =[UIImage imageWithCGImage:contextRef];
    CGContextRelease(context);
    CGImageRelease(contextRef);

    return grayImage;
}

@end
