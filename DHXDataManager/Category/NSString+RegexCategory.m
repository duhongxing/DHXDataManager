//
//  NSString+RegexCategory.m
//  GoodTrain
//
//  Created by MacOS on 17/3/14.
//  Copyright © 2017年 百通世纪. All rights reserved.
//

#import "NSString+RegexCategory.h"

@implementation NSString (RegexCategory)

//手机号分服务商
- (BOOL)isMobileNumberClassification{

    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d|705)\\d{7}$";

    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\d|709)\\d{7}$";

    NSString * CT = @"^1((33|53|8[09])\\d|349|700)\\d{7}$";

    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";

    if (([self isValidateByRegex:CM])
        || ([self isValidateByRegex:CU])
        || ([self isValidateByRegex:CT])
        || ([self isValidateByRegex:PHS]))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//手机号有效性
- (BOOL)isMobileNumber{

    /**
     65      *  手机号以13、15、18、170开头，8个 \d 数字字符
     66      *  小灵通 区号：010,020,021,022,023,024,025,027,028,029 还有未设置的新区号xxx
     67      */

    NSString *mobileNoRegex = @"^1((3\\d|5[0-35-9]|8[025-9])\\d|70[059])\\d{7}$";//除4以外的所有个位整数，不能使用[^4,\\d]匹配，这里是否iOS Bug?

    NSString *phsRegex =@"^0(10|2[0-57-9]|\\d{3})\\d{7,8}$";

    BOOL ret = [self isValidateByRegex:mobileNoRegex];

    BOOL ret1 = [self isValidateByRegex:phsRegex];

    return (ret || ret1);
}

//判断手机号有效性其他方法
- (BOOL)isMoblileNumberOtherMethod{
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170

    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";

    BOOL ret = [self isValidateByRegex:MOBILE];

    return ret;
}

//邮箱
- (BOOL)isEmailAddress{

    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

    return [self isValidateByRegex:emailRegex];

}

//汉字
- (BOOL)isChinese{
    NSString *chineseRegex = @"(^[\u4e00-\u9fa5]+$)";
    return [self isValidateByRegex:chineseRegex];
}

//仅为数字或字母
- (BOOL)isNumberOrLetter{
    NSString *regex = @"(^[a-zA-Z0-9]+$)";

    return [self isValidateByRegex:regex];
}


//包含汉字
- (BOOL)includeChinese{

    for (int i = 0; i < [self length]; i++) {

        int a = [self characterAtIndex:i];

        if (a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}

//身份证号
- (BOOL)simpleVerifyIdentityCardNum
{
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";

    return [self isValidateByRegex:regex2];
}

//正则相关
- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

@end
