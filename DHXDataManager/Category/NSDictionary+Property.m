//
//  NSDictionary+Property.m
//  TalentPool
//
//  Created by MacOS on 17/2/16.
//  Copyright © 2017年 baitongshiji. All rights reserved.
//

#import "NSDictionary+Property.h"

@implementation NSDictionary (Property)

/**
 create property list
 */
- (void)createProperty{
    NSMutableString *codes =[NSMutableString string];

    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

        NSString *code;

        if ([obj isKindOfClass:[NSString class]]) {

            code = [NSString stringWithFormat:@"@property (nonatomic,copy)NSString *%@;",key];

        }else if ([obj isKindOfClass:[NSArray class]]){

            code = [NSString stringWithFormat:@"@property (nonatomic,strong)NSArray *%@;",key];
        }else if ([obj isKindOfClass:[NSDictionary class]]){

            code = [NSString stringWithFormat:@"@property (nonatomic,strong)NSDictionary *%@;",key];

        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){

            code = [NSString stringWithFormat:@"@property (nonatomic,assign)BOOL %@;",key];

        }else if ([obj isKindOfClass:[NSNumber class]]){

            code = [NSString stringWithFormat:@"@property (nonatomic,strong)NSInteger %@;",key];
        }
        
        [codes appendFormat:@"\n%@\n",code];

    }];

    NSLog(@"%@",codes);
}

@end
