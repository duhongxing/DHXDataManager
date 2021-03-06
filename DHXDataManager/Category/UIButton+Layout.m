//
//  UIButton+Layout.m
//  DHXDataManager
//
//  Created by MacOS on 17/7/14.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "UIButton+Layout.h"
#import <objc/runtime.h>

@implementation UIButton (Layout)

//定义关联
static const char *titleRectKey = "hx_titleRectKey";
- (CGRect)titleRect{
    return [objc_getAssociatedObject(self, titleRectKey)CGRectValue];
}

- (void)setTitleRect:(CGRect)titleRect{
    objc_setAssociatedObject(self, titleRectKey, [NSValue valueWithCGRect:titleRect], OBJC_ASSOCIATION_RETAIN);
}

//定义关联
static const char *imageRectKey = "hx_imageRectKey";
- (CGRect)imageRect{
    return [objc_getAssociatedObject(self, imageRectKey)CGRectValue];
}

- (void)setImageRect:(CGRect)imageRect{
    objc_setAssociatedObject(self, imageRectKey, [NSValue valueWithCGRect:imageRect], OBJC_ASSOCIATION_RETAIN);
}

#pragma mark - ============== 通过运行时动态替换方法 ================

+ (void)load{

    MethodSwizzle(self,@selector(titleRectForContentRect:),@selector(override_titleRectForContentRect:));
    MethodSwizzle(self,@selector(imageRectForContentRect:),@selector(override_imageRectForContentRect:));
}

void MethodSwizzle(Class c,SEL origSEL,SEL overrideSEL)
{
    Method origMethod = class_getInstanceMethod(c, origSEL);
    Method overrideMethod = class_getInstanceMethod(c, overrideSEL);

    //运行时函数class_addMethod  如果发现方法已经存在 会失败返回 也可以用来做检查用:
    if (class_addMethod(c, origSEL, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)))
    {
        //如果添加成功(在父类中重写的方法) 再把目标类中的方法替换为旧有的实现:
        class_replaceMethod(c, overrideSEL, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }else
    {
        //addMethod 会让目标类的方法指向新的实现 使用replaceMethod再将新的方法指向原先的实现 这样就完成了交换操作
        method_exchangeImplementations(origMethod, overrideMethod);

    }
}

- (CGRect)override_titleRectForContentRect:(CGRect)contentRect{

    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero)) {
        return self.titleRect;
    }
    return [self override_titleRectForContentRect:contentRect];
}

- (CGRect)override_imageRectForContentRect:(CGRect)contentRect{

    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }
    return [self override_imageRectForContentRect:contentRect];
}


@end
