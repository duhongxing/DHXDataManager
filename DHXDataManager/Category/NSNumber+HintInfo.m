//
//  NSNumber+ZP_Code.m
//  WeChatPay_Test
//
//  Created by zhipeng on 2016/11/29.
//  Copyright © 2016年 Br. All rights reserved.
//

#import "NSNumber+HintInfo.h"

@implementation NSNumber (HintInfo)
- (NSString *)hintInfo
{
    switch ([self intValue]) {
        case 0  	: return @"业务成功"; break;
        case 1  	: return @"业务失败"; break;
        case 1000	: return @"电话格式错误"; break;
        case 1001	: return @"该电话已注册"; break;
        case 1002	: return @"账户密码错误"; break;
        case 1003	: return @"账户名不存在"; break;
        case 1004	: return @"输入6~12位密码"; break;
        case 1005	: return @"手机号未注册"; break;
        case 1006	: return @"数据库操作失败"; break;
        case 1007	: return @"简历不存在或已删除"; break;
        case 1008	: return @"不能删除默认简历,请先更改默认简历然后删除"; break;
        case 1009	: return @"未找到数据"; break;
        case 1010	: return @"缺少必备参数"; break;
            
//        case 1011	: return @"确认密码为空"; break;
//        case 1012	: return @"验证码为空"; break;
//        case 1013	: return @"机构代码为空"; break;
//        case 1014	: return @"订单类型orderType为空"; break;
//        case 1015	: return @"验证码不匹配"; break;
//        case 1016	: return @"机构代码不正确"; break;
//        case 1018	: return @"两次密码不匹配"; break;
//        case 1019	: return @"不是经纪人（是否经纪人接口，不是时返回）"; break;
//        case 1020	: return @"nowPwd当前密码为空"; break;
//        case 1021	: return @"newPwd新密码为空"; break;
//        case 1022	: return @"startTime不为空时，endTime也不能为空"; break;
//        case 1023	: return @"申请中的经纪人"; break;
//        case 1024	: return @"已申请过但是没有通过"; break;
//        case 1026	: return @"非交易日"; break;
//        case 1027	: return @"agentId不存在"; break;
//        case 1028	: return @"不能重复建仓"; break;
//        case 1029	: return @"赢家券数量小于手数"; break;
//        case 1030	: return @"手机号已存在"; break;
//        case 1031	: return @"验证码已过期"; break;
//        case 1032	: return @"该微信id已经注册"; break;
//        case 1033	: return @"请先获取验证码"; break;
//        case 1034	: return @"productId不存在"; break;
//        case 1035	: return @"contract不存在"; break;
//        case 1036	: return @"appid不存在"; break;
//        case 1037	: return @"会员编号不存在"; break;
//        case 1038	: return @"URL不存在"; break;
//        case 1039	: return @"收货人姓名不存在"; break;
//        case 1040	: return @"收货人手机不存在"; break;
//        case 1041	: return @"收货人地址不存在"; break;
//        case 1042	: return @"交割商品id不存在"; break;
//        case 1043	: return @"交割商品数量不存在"; break;
//        case 1044	: return @"手续费不存在"; break;
//        case 1045	: return @"总的商品价格不存在"; break;
//        case 1046	: return @"报价不存在"; break;
//        case 1047	: return @"余额不足"; break;
//        case 1048	: return @"月份不能为空"; break;
//        case 1049	: return @"在线教育id不能为空"; break;
//        case 1050	: return @"设置止损小于当前止损"; break;
//        case 1052	: return @"该单已是平仓单"; break;
          case 1053	: return @"token验证失败"; break;
//        case 1070	: return @"标识已经超时"; break;
//        case 1071	: return @"标识生成失败"; break;
//        case 1074	: return @"地址为空"; break;
//        case 1075	: return @"手机号已经存在"; break;
//        case 1076	: return @"标识有效！"; break;
//        case 1078	: return @"标识为空"; break;
//        case 1079	: return @"手机验证码为空！"; break;
        default:
            return @"";
            break;
    }
}
@end
