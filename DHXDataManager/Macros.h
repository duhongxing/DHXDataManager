//
//  Macros.h
//  DHXDataManager
//
//  Created by MacOS on 17/7/17.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define SCREEN_WIDTH  CGRectGetWidth([UIScreen mainScreen].bounds)

//打印
#ifdef DEBUG
#define BTLog(fmt,...) NSLog((@"%s [line %d] " fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#else
#define BTLog(...)
#endif

//@#的使用, 我们添加一个普通的宏:加@#是怎么使用的:  # 的意思是紧跟着它的后面的标识符添加一个双引号""
//#define LRToast(str) [NSString stringWithFormat:@"%@",@#str]

#define BTFormat(str) [NSString stringWithFormat:@"%@",str]

#define BTWeakObj(o)  autoreleasepool{} __weak typeof(o)  o##Weak= o;
#define BTStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

// MainScreen Height & Width
#define InsetHeight 113
#define MAIN_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define MAIN_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

// MainScreen bounds
#define Main_Screen_Bounds [[UIScreen mainScreen] bounds]

#define DeviceVersion  [UIDevice currentDevice].systemVersion.floatValue

// 字体大小(常规/粗体)
#define BOLD_SYSTEM_FONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEM_FONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//App版本号
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 当前版本
#define FSystemVersion          ([[[UIDevice currentDevice] systemVersion] floatValue])
#define DSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])
#define SSystemVersion          ([[UIDevice currentDevice] systemVersion])

// 是否大于等于IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
// 是否IOS6
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0)
// 是否大于等于IOS8
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0)
// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
// 是否iPad
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 是否空对象
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


//AppDelegate对象
#define AppDelegateInstance [[UIApplication sharedApplication] delegate]

//常用缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//获取当前语言
#define kCurrentLanguage [[NSLocale preferredLanguages]objectAtIndex:0]


//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//-------color macros-----

//背景颜色
#define WhiteColor [UIColor whiteColor]
#define ClearColor [UIColor clearColor]

#define MAIN_COLOR HEX_COLOR(0x00b3e9)
#define MAIN_BACK_COLOR RGBCOLOR(245,245, 245)


#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define myBlue  [UIColor colorWithRed:2/255.0 green:152/255.0 blue:254/255.0 alpha:1]
#define myGray  [UIColor colorWithRed:242/255.0 green:244/255.0 blue:245/255.0 alpha:1]

#define HX_BLUECOLOR [UIColor colorWithRed:-0/255.0 green:180/255.0 blue:233/255.0 alpha:1.0]

#define HEX_COLOR_A(hexValue,a) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:a]

#define HEX_COLOR(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

//本地图片
#define LocalImage(imageName) [UIImage imageNamed:imageName]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//View 圆角
#define ViewRadius(View,Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


@import UIKit;

static inline BOOL BTIsEmpty(id objcet) {

    return objcet == nil || [objcet isEqual:[NSNull null]] || ([objcet respondsToSelector:@selector(length)] && [(NSData *)objcet length] == 0) || ([objcet respondsToSelector:@selector(count)] && [(NSArray *)objcet count] == 0);
}


UIKIT_STATIC_INLINE UIViewController *BTCurrentViewController() {

    UIViewController *topViewController = [[UIApplication sharedApplication].keyWindow rootViewController];

    if ([topViewController isKindOfClass:[UITabBarController class]]) {

        topViewController = ((UITabBarController *)topViewController).selectedViewController;
    }

    if ([topViewController presentedViewController]) {

        topViewController = [topViewController presentedViewController];
    }

    if ([topViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *)topViewController topViewController]) {

        return [(UINavigationController*)topViewController topViewController];
    }

    return topViewController;
}


#endif /* Macros_h */
