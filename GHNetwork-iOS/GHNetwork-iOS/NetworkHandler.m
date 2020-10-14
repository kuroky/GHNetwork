//
//  NetworkHandler.m
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import "NetworkHandler.h"
#import <GHNetworkRequest.h>

@implementation NetworkHandler

+ (instancetype)handler {
    static dispatch_once_t onceToken;
    static NetworkHandler *handler;
    dispatch_once(&onceToken, ^{
        handler = [NetworkHandler new];
    });
    return handler;
}

- (NSDictionary <NSString *, NSString *> *)requireHeaders {
    return @{@"ApiType": @"IOS",
             @"Version": @"1.0.0",
             @"userToken": @"1"};
}

- (GHNetworkResponse *)handleRequest:(GHNetworkRequest *)request {
    GHNetworkResponse *reponse = [self parseResponse:request.responseData];
    #if DEBUG
    [self printLog:request reponse:reponse];
    #endif
    return reponse;
}

- (GHNetworkResponse *)parseResponse:(NSData *)responseData {
    NSDictionary *dic = @{};
    if (responseData) {
        dic = [NSJSONSerialization JSONObjectWithData:responseData
                                              options:NSJSONReadingAllowFragments
                                                error:nil];
    }
    else {
        dic = @{@"respMsg": @"请求失败,请稍后再试",
                @"respCode": @(408)};
    }
    GHNetworkResponse *reponse = [GHNetworkResponse new];
    reponse.errMsg = dic[@"respMsg"];
    reponse.respData = dic[@"data"];
    id code = dic[@"respCode"];
    NSInteger errCode = 408;
    if ([code isKindOfClass:[NSNumber class]]) {
        errCode = [(NSNumber *)code integerValue];
    }
    else if ([code isKindOfClass:[NSString class]]) {
        errCode = [(NSString *)code integerValue];
    }
    reponse.errCode = errCode;
    reponse.isSuccess = errCode == 0 ? YES : NO;
    return reponse;
}

- (void)printLog:(GHNetworkRequest *)request
         reponse:(GHNetworkResponse *)response {
    NSURL *base = [NSURL URLWithString:request.baseUrl];
    NSString *url = [NSURL URLWithString:request.requestUrl relativeToURL:base].absoluteString;
    id para = request.requestArgument;
    if (!para) {
        para = @{};
    }
    
    double requestTimer = (request.endInterval - request.startInterval) * 1000;
    NSString *interval = [NSString stringWithFormat:@"Http请求: %.fms", requestTimer];
    
    if (response.isSuccess) {
        if (requestTimer > 300) {
            NSLog(@"requestUrl: %@\n %@ (接口响应时间超过300ms) \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
        }
        else {
            NSLog(@"requestUrl: %@\n %@ \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
        }
    }
    else {
        NSLog(@"requestUrl: %@\n %@ \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
    }
}

@end
