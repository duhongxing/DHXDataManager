//
//  NSString+RegexCategory.h
//  GoodTrain
//
//  Created by MacOS on 17/3/14.
//  Copyright © 2017年 百通世纪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegexCategory)

//手机号有效性
- (BOOL)isMobileNumber;

//手机号有效性 其他方法
- (BOOL)isMoblileNumberOtherMethod;

//邮箱
- (BOOL)isEmailAddress;

//判断是否是纯汉字
- (BOOL)isChinese;

//包含文字
- (BOOL)includeChinese;

//仅为数字或字母
- (BOOL)isNumberOrLetter;

//身份证号
- (BOOL)simpleVerifyIdentityCardNum;

@end
