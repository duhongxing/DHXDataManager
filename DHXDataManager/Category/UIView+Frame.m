//
//  UIView+Frame.m
//  TalentPool
//
//  Created by MacOS on 17/2/20.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)bt_top{
    return self.frame.origin.y;
}

- (void)setBt_top:(CGFloat)bt_top{
    CGRect frame = self.frame;
    frame.origin.y = bt_top;
    self.frame = frame;
}

- (CGFloat)bt_right{

    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBt_right:(CGFloat)bt_right{
    CGRect frame = self.frame;
    frame.origin.x = bt_right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)bt_bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBt_bottom:(CGFloat)bt_bottom{
    CGRect frame = self.frame;
    frame.origin.y = bt_bottom - self.frame.size.height;

}

- (CGFloat)bt_left{
    return self.frame.origin.x;
}

- (void)setBt_left:(CGFloat)bt_left{
    CGRect frame = self.frame;
    frame.origin.x = bt_left;
    self.frame = frame;
}

- (CGFloat)bt_width{
    return self.frame.size.width;
}

- (void)setBt_width:(CGFloat)bt_width{
    CGRect frame = self.frame;
    frame.size.width = bt_width;
    self.frame = frame;
}

- (CGFloat)bt_height{
    return self.frame.size.height;
}

- (void)setBt_height:(CGFloat)bt_height{
    CGRect frame = self.frame;
    frame.size.height = bt_height;
    self.frame = frame;
}

#pragma mark --> frame properties

- (CGPoint)bt_origin{

    return self.frame.origin;
}

- (void)setBt_origin:(CGPoint)bt_origin{
    CGRect frame = self.frame;
    frame.origin = bt_origin;
    self.frame = frame;
}

- (CGSize)bt_size{
    return self.frame.size;
}

- (void)setBt_size:(CGSize)bt_size{
    CGRect frame = self.frame;
    frame.size = bt_size;
    self.frame = frame;
}

#pragma mark --> positions

- (CGFloat)bt_centerX{
    return self.center.x;
}

- (void)setBt_centerX:(CGFloat)bt_centerX{
    self.center = CGPointMake(bt_centerX, self.center.y);
}

- (CGFloat)bt_centerY{
    return self.center.y;
}

- (void)setBt_centerY:(CGFloat)bt_centerY{
    self.center = CGPointMake(self.center.x, bt_centerY);
}

@end
