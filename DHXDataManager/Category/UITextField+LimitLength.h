//
//  UITextField+LimitLength.h
//  DHXDataManager
//
//  Created by MacOS on 17/7/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitLength)


/**
 限制输入长度

 @param length 限制长度
 */
- (void)hx_limitLength:(NSUInteger)length;

@end
