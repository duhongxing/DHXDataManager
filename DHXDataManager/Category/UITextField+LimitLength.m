//
//  UITextField+LimitLength.m
//  DHXDataManager
//
//  Created by MacOS on 17/7/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "UITextField+LimitLength.h"

@implementation UITextField (LimitLength)

- (void)hx_limitLength:(NSUInteger)length{
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [[NSNotificationCenter defaultCenter]addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:mainQuene usingBlock:^(NSNotification * _Nonnull note) {

        if (self.text.length > length && !self.markedTextRange) {

            self.text = [self.text substringWithRange:NSMakeRange(0, length)];
        }

    }];
}

@end
