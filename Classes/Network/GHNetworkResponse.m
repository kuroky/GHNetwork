//
//  GHNetworkResponse.h.m
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "GHNetworkResponse.h"
#import "GHNetworkRequest.h"

@implementation GHNetworkResponse

#pragma mark - 解析
+ (GHNetworkResponse *)parseNetworkData:(GHNetworkRequest *)request {
    return [self parseResponse:request.responseData];
}

+ (GHNetworkResponse *)parseNetworkError:(GHNetworkRequest *)request {
    return [self parseResponse:request.responseData];
}

+ (GHNetworkResponse *)parseResponse:(NSData *)responseData {
    NSString *errMsg = nil;
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
    else {
        errCode = code;
    }
    reponse.errCode = errCode;
    reponse.isSuccess = errCode == 0 ? YES : NO;
    return reponse;
}

- (NSString *)description {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:_errMsg forKey:@"errMsg"];
    [data setValue:@(_errCode) forKey:@"errCode"];
    [data setValue:_respData forKey:@"data"];
    return [NSString stringWithFormat:@"<%@:%p>:%@",[self class], &self, data];
}

- (NSString *)debugDescription {
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    [data setValue:_errMsg forKey:@"errMsg"];
    [data setValue:@(_errCode) forKey:@"errCode"];
    [data setValue:_respData forKey:@"data"];
    return [NSString stringWithFormat:@"<%@:%p>:%@",[self class], &self, data];
}

@end
