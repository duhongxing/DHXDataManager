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
    self.navigationController.navigationBar.translucent = NO;

    self.title = @"DataManager";


    DHXButton *button =[[DHXButton alloc]initWithFrame:CGRectMake(50, 20, 260, 40)];
    [button setImage:[UIImage imageNamed:@"公司默认头像"] forState:UIControlStateNormal];
    [button setTitle:@"DataManager" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    button.imageRect = CGRectMake(10, 5, 30, 30);
    button.titleRect = CGRectMake(45, 5, 200, 30);
    [self.view addSubview:button];

    
}

- (void)click:(UIButton *)button{
    NSLog(@"click");
}


#pragma mark - =======  常用控件     ========

@end
