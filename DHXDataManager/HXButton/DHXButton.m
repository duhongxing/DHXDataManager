//
//  DHXButton.m
//  DHXDataManager
//
//  Created by MacOS on 17/7/14.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "DHXButton.h"

@implementation DHXButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect{

    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect,CGRectZero)) {
        return self.titleRect;
    }

    return [super titleRectForContentRect:contentRect];
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect{

    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero)) {
        return self.imageRect;
    }

    return [super imageRectForContentRect:contentRect];
}



@end
