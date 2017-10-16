//
//  UIButton+Various.h
//  HSButton
//
//  Created by Kean on 2016/11/17.
//  Copyright © 2016年 Kean. All rights reserved.
//  https://github.com/keanlove/HSButton

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HSButtonStyle) {
    
    HSButtonTitleEmbedImage,        // 文字内嵌有图片
    HSButtonTitleOptionLine,        // 有文字，选择性划线
};

typedef NS_ENUM(NSUInteger, HSButtonLineationDirection) {
    
    HSButtonLineationTop,           // 划线在上，标题在下
    HSButtonLineationLeft,          // 划线在左，标题在右
    HSButtonLineationBottom,        // 划线在下，标题在上
    HSButtonLineationRight          // 划线在右，标题在左
    
};

typedef NS_ENUM(NSUInteger, HSButtonEdgeInsetsStyle) {
    
    HSButtonEdgeInsetsStyleTop,     // image在上，label在下
    HSButtonEdgeInsetsStyleLeft,    // image在左，label在右
    HSButtonEdgeInsetsStyleBottom,  // image在下，label在上
    HSButtonEdgeInsetsStyleRight    // image在右，label在左
    
};

@interface UIButton (Various)

@property (nonatomic, assign) CGFloat buttonTextW; // 按钮中文本标题的宽度
@property (nonatomic, assign) CGFloat buttonTextH; // 按钮中文本标题的高度


/**
 文字内嵌有图片的按钮配置  项目中没有设置该类按钮默认图片

 @param style           枚举按钮样式 HSButtonStyle
 @param imageNameN      按钮正常状态显示的图片
 @param imageNameH      按钮高亮状态显示的图片
 @param imageNameD      按钮不可点击状态显示的图片
 @return 返回 button
 */
+ (UIButton *)noDefaultImageButtonStyle:(HSButtonStyle)style text:(NSString *)text font:(UIFont *)font textNormalColor:(UIColor *)textNormalColor textHighColor:(UIColor *)textHighColor imageNameN:(NSString *)imageNameN imageNameH:(NSString *)imageNameH imageNameD:(NSString *)imageNameD;

/**
 项目中已经设置了该类按钮默认图片，在此方法可修改默认图片的设置
 */
+ (UIButton *)haveDefaultImageButtonStyle:(HSButtonStyle)style text:(NSString *)text font:(UIFont *)font textNormalColor:(UIColor *)textNormalColor textHighColor:(UIColor *)textHighColor;

/**
 注： 插入的 image 和 label 的宽度之和不能 超过 button 的宽度
 文字在图片周围的按钮配置

 @param style       文字在图片周围的样式 HSButtonEdgeInsetsStyle
 @param space       标题和按钮之间的间隔
 @return            返回 button
 */
+ (UIButton *)initButtonEdgeInsetsStyle:(HSButtonEdgeInsetsStyle)style buttonFrame:(CGRect)frame titleImage:(NSString *)titleImage titleLabel:(NSString *)text titleColor:(UIColor *)titleColor font:(UIFont *)font imageAndTitleSpace:(CGFloat)space;

/**
 设置划线的方向 HSButtonLineationDirection
 
 @param direction 枚举方向
 @param lineColor 划线颜色
 @param size      划线的尺寸
 @param space     划线与文字标题的间隔
 */
- (void)lineDirection:(HSButtonLineationDirection)direction lineColor:(UIColor *)lineColor size:(CGSize)size space:(CGFloat)space;

@end



