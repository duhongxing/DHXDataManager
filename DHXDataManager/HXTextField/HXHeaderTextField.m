//
//  HXHeaderTextField.m
//  DHXDataManager
//
//  Created by MacOS on 17/7/18.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "HXHeaderTextField.h"

@implementation HXHeaderTextField

- (CGRect)textRectForBounds:(CGRect)bounds{

    return CGRectInset(bounds, 15, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{

    return CGRectInset(bounds, 15, 0);
}

@end
