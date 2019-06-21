//
//  GHNetworkResponse.h
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GHNetworkResponse : NSObject

/**
 请求状态 成功或失败
 */
@property (nonatomic, assign) BOOL isSuccess;

/**
 返回码状态码
 */
@property (nonatomic, assign) NSInteger errCode;

/**
 报错信息
 */
@property (nonatomic, copy) NSString *errMsg;

/**
 业务数据 Dic/Arr
 */
@property (nonatomic, strong) id respData;

@end
