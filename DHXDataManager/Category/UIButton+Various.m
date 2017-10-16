//
//  UIButton+Various.m
//  HSButton
//
//  Created by Kean on 2016/11/17.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "UIButton+Various.h"
#import <objc/runtime.h>

static char buttonTextWKey;
static char buttonTextHKey;

@implementation UIButton (Various)

- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
}

// 设置 buttonText 宽高的 set,get 方法
- (CGFloat)buttonTextW {
    
    return [objc_getAssociatedObject(self, &buttonTextWKey) floatValue];
    
}

- (void)setButtonTextW:(CGFloat)buttonTextW {
    
    NSString *textW = [NSString stringWithFormat:@"%f",(float)buttonTextW];
    objc_setAssociatedObject(self, &buttonTextWKey, textW , OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (CGFloat)buttonTextH {
    
    return [objc_getAssociatedObject(self, &buttonTextHKey) floatValue];
    
}

- (void)setButtonTextH:(CGFloat)buttonTextH {
    
    NSString *textH = [NSString stringWithFormat:@"%f",(float)buttonTextH];
    objc_setAssociatedObject(self, &buttonTextHKey, textH , OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

// 配置按钮
+ (UIButton *)noDefaultImageButtonStyle:(HSButtonStyle)style text:(NSString *)text font:(UIFont *)font textNormalColor:(UIColor *)textNormalColor textHighColor:(UIColor *)textHighColor imageNameN:(NSString *)imageNameN imageNameH:(NSString *)imageNameH imageNameD:(NSString *)imageNameD;
 {
    
    UIButton *button = [UIButton setButtonStyle:style WithImageNameN:imageNameN nameH:imageNameH nameD:imageNameD];
    [button setButtonBaseText:text font:font textNormalColor:textNormalColor textHighColor:textHighColor];
    
    return button;
}

+ (UIButton *)haveDefaultImageButtonStyle:(HSButtonStyle)style text:(NSString *)text font:(UIFont *)font  textNormalColor:(UIColor *)textNormalColor textHighColor:(UIColor *)textHighColor {
    UIButton *button = [UIButton setButtonStyle:style WithImageNameN:nil nameH:nil nameD:nil];
    [button setButtonBaseText:text font:font textNormalColor:textNormalColor textHighColor:textHighColor];
    
    // 计算文本的宽高
    if(button.titleLabel.text != nil) [button countButtonLabelTextSize];
    
    return button;
    
}

// 按钮基本公共属性设置
- (void)setButtonBaseText:(NSString *)text font:(UIFont *)font textNormalColor:(UIColor *)textNormalColor textHighColor:(UIColor *)textHighColor {
    
    [self setTitle:text forState:UIControlStateNormal];
    self.titleLabel.font = font;
    // 设置标题不同状态时的默认颜色
    [self setTitleColor:textNormalColor forState:UIControlStateNormal];
    [self setTitleColor:textHighColor forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
}




// switch 不同按钮的样式
+ (UIButton *)setButtonStyle:(HSButtonStyle)style WithImageNameN:(NSString *)nameN nameH:(NSString *)nameH nameD:(NSString *)nameD {
    
    UIButton *button = [[UIButton alloc] init];
    
    switch (style) {
        case HSButtonTitleEmbedImage:{
            if (!nameN) {
                UIImage *imageN = [[UIImage imageNamed:@"2.jpg"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
                [button setBackgroundImage:imageN forState:UIControlStateNormal];
                
                UIImage *imageH = [[UIImage imageNamed:@"1.jpg"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
                [button setBackgroundImage:imageH forState:UIControlStateHighlighted];
                
                UIImage *imageD = [[UIImage imageNamed:@"0.jpg"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
                [button setBackgroundImage:imageD forState:UIControlStateDisabled];
                
            }
            else {
                UIImage *imageN = [[UIImage imageNamed:nameN] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
                [button setBackgroundImage:imageN forState:UIControlStateNormal];
                
                UIImage *imageH = [[UIImage imageNamed:nameH] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
                [button setBackgroundImage:imageH forState:UIControlStateHighlighted];
                
                UIImage *imageD = [[UIImage imageNamed:nameD] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch];
                [button setBackgroundImage:imageD forState:UIControlStateDisabled];
                
            }
            break;
        }
            
        case HSButtonTitleOptionLine: {
            
            break;
            
        }
            
        default:
            break;
            
    }
    
    return button;
    
}

// 文字插入按钮周围样式的配置
+ (UIButton *)initButtonEdgeInsetsStyle:(HSButtonEdgeInsetsStyle)style buttonFrame:(CGRect)frame  titleImage:(NSString *)titleImage titleLabel:(NSString *)text titleColor:(UIColor *)titleColor font:(UIFont *)font imageAndTitleSpace:(CGFloat)space {
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:titleImage] forState:UIControlStateNormal];
    button.titleLabel.font = font;
    if(button.titleLabel.text != nil) [button countButtonLabelTextSize];
    
    CGFloat imageWidth = button.imageView.frame.size.width;
    CGFloat imageHeight  = button.imageView.frame.size.height;
    
    CGFloat labelWidth = button.buttonTextW;
    CGFloat labelHeight = button.buttonTextH;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    
    CGFloat iHorMove  = fabs(labelWidth / 2);
    CGFloat iVerMove = fabs(labelHeight / 2);
    
    CGFloat lHorMove  = fabs(- imageWidth / 2);
    CGFloat lVerMove = fabs(- imageHeight / 2);
    
    switch (style) {
        case HSButtonEdgeInsetsStyleTop:{
            imageEdgeInsets = UIEdgeInsetsMake(-iVerMove - space, iHorMove, iVerMove, -iHorMove);
            labelEdgeInsets = UIEdgeInsetsMake(lVerMove + space, -lHorMove, -lVerMove, lHorMove);
            break;
        }
        case HSButtonEdgeInsetsStyleLeft:{
            
            imageEdgeInsets = UIEdgeInsetsMake(0, -space / 2.0, 0, space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space / 2.0, 0, -space / 2.0);
            
            break;
        }
        case HSButtonEdgeInsetsStyleBottom:{
            imageEdgeInsets = UIEdgeInsetsMake(-iVerMove + labelHeight + space, iHorMove, iVerMove -labelHeight, - iHorMove);
            labelEdgeInsets = UIEdgeInsetsMake(lVerMove - imageHeight  - space, -lHorMove , -lVerMove + imageHeight, lHorMove);
            
            
            break;
        }
        case HSButtonEdgeInsetsStyleRight:{
            
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space / 2.0, 0, -labelWidth - space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space / 2.0, 0, imageWidth + space / 2.0);
            
            break;
        }
        default:
            break;
    }
    
    button.titleEdgeInsets = labelEdgeInsets;
    button.imageEdgeInsets = imageEdgeInsets;
    
    return button;
}

// 计算文本的宽高
- (void)countButtonLabelTextSize {
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:self.titleLabel.text];
    self.titleLabel.attributedText = attrStr;
    NSDictionary *attributes = @{NSFontAttributeName:self.titleLabel.font};
    
    // 用于计算文本绘制时占据的矩形块
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:self.titleLabel.bounds.size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    self.buttonTextW = textSize.width;
    self.buttonTextH = textSize.height;
    
}


//  switch 划线按钮不同的方向
- (void)lineDirection:(HSButtonLineationDirection)direction lineColor:(UIColor *)lineColor size:(CGSize)size space:(CGFloat)space
{
    switch (direction) {
        case HSButtonLineationTop: {
            
            [self drawLineColor:lineColor center:CGPointMake(self.frame.size.width / 2, (self.frame.size.height - self.buttonTextH) / 2 - space) size:size space:space];
            break;
        }
        case HSButtonLineationLeft: {
            
            [self drawLineColor:lineColor center:CGPointMake((self.frame.size.width - self.buttonTextW) / 2  - space, self.frame.size.height/ 2) size:size space:space];
            break;
        }
            
        case HSButtonLineationBottom: {
            
            [self drawLineColor:lineColor center:CGPointMake(self.frame.size.width / 2, (self.frame.size.height + self.buttonTextH) / 2 + space) size:size space:space];
            break;
        }
            
        case HSButtonLineationRight: {
            
            [self drawLineColor:lineColor center:CGPointMake((self.frame.size.width + self.buttonTextW) / 2 + space, self.frame.size.height / 2 + space) size:size space:space];
            break;
        }
            
        default:
            break;
            
    }
    
}

// 画划线
- (void)drawLineColor:(UIColor *)color center:(CGPoint)center size:(CGSize)size space:(CGFloat)space {
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    imageView.center = center;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    imageView.image = image;
    [self addSubview:imageView];
    
    
}



@end
