//
//  UIView+Frame.h
//  TalentPool
//
//  Created by MacOS on 17/2/20.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic,assign)CGPoint bt_origin;
@property (nonatomic,assign)CGSize bt_size;

@property (nonatomic)CGFloat bt_centerX;
@property (nonatomic)CGFloat bt_centerY;

@property (nonatomic)CGFloat bt_top;
@property (nonatomic)CGFloat bt_bottom;
@property (nonatomic)CGFloat bt_right;
@property (nonatomic)CGFloat bt_left;

@property (nonatomic)CGFloat bt_width;
@property (nonatomic)CGFloat bt_height;


@end
