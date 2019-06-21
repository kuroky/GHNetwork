//
//  GHNetworkHandleDelegate.h
//  AFNetworking
//
//  Created by kuroky on 2019/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GHNetworkResponse;
@class GHNetworkResponse;

@protocol GHNetworkHandleDelegate <NSObject>

/**
 业务逻辑处理

 @param request 请求request
 @param response 返回response
 */
- (void)handleNetwork:(GHNetworkResponse *)request
          forResponse:(GHNetworkResponse *)response;

/**
 请求headers

 @return @{}
 */
- (NSDictionary <NSString *, NSString *> *)requireHeaders;

@end

NS_ASSUME_NONNULL_END
