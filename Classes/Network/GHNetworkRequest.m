//
//  GHNetworkRequest.m
//  Emucoo
//
//  Created by kuroky on 2017/6/22.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "GHNetworkRequest.h"
#import "GHNetworkManager.h"
#import "GHNetworkHandleDelegate.h"

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif

@interface GHNetworkRequest ()

@property (nonatomic, weak) id <GHNetworkHandleDelegate> handleDelegate;
@property (nonatomic, assign, readwrite) CFTimeInterval startInterval;
@property (nonatomic, assign, readwrite) CFTimeInterval endInterval;

@end

@implementation GHNetworkRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

// 设置业务代理
- (void)setup {
    self.handleDelegate = [GHNetworkManager sharedManager].handleDelegate;
}

// 默认超时时间
- (NSTimeInterval)requestTimeoutInterval {
    return 15;
}

// 默认请求方法 POST
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

// 默认请求为JSON格式
- (YTKRequestSerializerType)requestSerializerType {
    return YTKRequestSerializerTypeJSON;
}

- (NSString *)baseUrl {
    return [YTKNetworkConfig sharedConfig].baseUrl;
}

- (void)gh_requestWithCompletion:(void (^)(GHNetworkResponse *response))completion {
    self.startInterval = CACurrentMediaTime();
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        self.endInterval = CACurrentMediaTime();
        GHNetworkResponse *response = nil;
        if (self.handleDelegate) {
            response = [self.handleDelegate handleRequest:request];
        }
        completion ? completion(response) : nil;
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        self.endInterval = CACurrentMediaTime();
        GHNetworkResponse *response = nil;
        if (self.handleDelegate) {
            response = [self.handleDelegate handleRequest:request];
        }
        completion ? completion(response) : nil;
    }]; 
}

// headers添加
- (NSDictionary *)requestHeaderFieldValueDictionary {
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    if (self.handleDelegate && [self.handleDelegate respondsToSelector:@selector(requireHeaders)]) {
        [self.handleDelegate.requireHeaders enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            [headers setValue:obj forKey:key];
        }];
    }
    return headers;
}
  
@end
