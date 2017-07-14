//
//  ViewController.m
//  DHXDataManager
//
//  Created by MacOS on 17/7/12.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "ViewController.h"
#import "DHXButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    DHXButton *button =[[DHXButton alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];

    [button setImage:[UIImage imageNamed:@"公司默认头像"] forState:UIControlStateNormal];
    [button setTitle:@"共同附加" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    button.imageRect = CGRectMake(10, 5, 30, 30);
    button.titleRect = CGRectMake(45, 5, 100, 30);
    [self.view addSubview:button];

    
}


- (void)click:(UIButton *)button{
    NSLog(@"click");
}


@end
