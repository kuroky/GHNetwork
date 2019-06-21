//
//  GHNetworkRequest.h
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "GHNetworkResponse.h"

/**
 基于YTKNetwork Request的基类
 */
@interface GHNetworkRequest : YTKRequest

/**
 发起请求

 @param completion response block
 */
- (void)em_requestWithCompletion:(void (^)(GHNetworkResponse *response))completion;

/**
 请求开始
 */
@property (nonatomic, assign, readonly) CFTimeInterval startInterval;

/**
 请求结束
 */
@property (nonatomic, assign, readonly) CFTimeInterval endInterval;

@end
