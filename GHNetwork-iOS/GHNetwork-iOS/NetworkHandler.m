//
//  NetworkHandler.m
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import "NetworkHandler.h"
#import <GHNetworkRequest.h>
#import <AFNetworking/AFSecurityPolicy.h>

static  NSInteger   const   kMaxRequestTime     =   500; // 500毫秒

@interface NetworkHandler ()

@end

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
    NSDictionary *para = self.verifyHeaders;
    return para;
}

- (NSDictionary <NSString *, NSString *> *)basicHeaders {
    static dispatch_once_t onceToken;
    static NSMutableDictionary *para;
    dispatch_once(&onceToken, ^{
        para = [NSMutableDictionary dictionary];
        [para setValue:@"zh_cn" forKey:@"lan"];
        NSString *deviceName = @"deviceName";
        [para setObject:deviceName forKey:@"device"];
        [para setObject:@"1" forKey:@"os_type"]; // 1:ios; 2:android
        //[para setObject:[HBDefine appChannelForHeader] forKey:@"channel"];
        NSString *clientVersion = @"1.0.0";
        [para setObject:clientVersion forKey:@"client_ver"];
        [para setObject:@"zh_cn" forKey:@"os_lan"];
        [para setObject:@"deviceid" forKey:@"device_id"];
    });
    return para;
}

- (NSDictionary <NSString *, NSString *> *)verifyHeaders {
    NSMutableDictionary *headers = [NSMutableDictionary dictionaryWithDictionary:self.basicHeaders];
    //NSString *sessionKey = [WOAccounter sharedManager].account.sessionKeyString;
    //[headers setValue:sessionKey forKey:@"session_key"];
    return headers;
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
        
    CFTimeInterval endInterval = CACurrentMediaTime();
    CGFloat requestTimer = (endInterval - request.startInterval) * 1000;
    BOOL requestTimeLong = requestTimer > kMaxRequestTime ? YES : NO;
    NSString *interval = [NSString stringWithFormat:@"Http请求: %.2f 毫秒", requestTimer];
    
    if (response.isSuccess) {
        if (requestTimeLong) {
            NSLog(@"requestUrl: %@\n %@ (接口耗时过长) \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
        }
        else {
            NSLog(@"requestUrl: %@\n %@ \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
        }
    }
    else {
        NSLog(@"requestUrl: %@\n %@ \n parameters: %@\n response: %@ header: %@", url, interval, para, response, request.requestHeaderFieldValueDictionary);
    }
}


//MARK: - Https Set
- (AFSecurityPolicy *)fetchSecurityPolicy {
    AFSecurityPolicy *policy; // 由服务端校验
    //if (HBServerEdition != HBEditionPro) {
    policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.validatesDomainName = NO; // 是否验证域名
    policy.allowInvalidCertificates = YES;
    return policy;
    //}
    /*
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"hb" ofType:@"cer"];
    if (!cerPath) {
        return nil;
    }
    
    NSData *cerData = [[NSData alloc] initWithContentsOfFile:cerPath];
    if (!cerData) {
        return nil;
    }
    
    policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate
                              withPinnedCertificates:[NSSet setWithObject:cerData]];
    return policy;
     */
}


@end
