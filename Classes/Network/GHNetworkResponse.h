//
//  GHNetworkResponse.h
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EMBaseRequest;

@interface GHNetworkResponse : NSObject

/**
 请求成功
 */
@property (nonatomic, assign) BOOL isSuccess;

/**
 返回码
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

/**
 解析网络数据

 @param request 请求request
 @return EMResponse 数据
 */
+ (GHNetworkResponse *)parseNetworkData:(EMBaseRequest *)request;

/**
 解析网络异常时数据
 
 @param request 请求request
 @return EMResponse 数据
 */
+ (GHNetworkResponse *)parseNetworkError:(EMBaseRequest *)request;

@end
