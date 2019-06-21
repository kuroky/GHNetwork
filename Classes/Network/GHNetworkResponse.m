//
//  GHNetworkResponse.h.m
//  Emucoo
//
//  Created by kuroky on 2017/7/10.
//  Copyright © 2017年 Emucoo. All rights reserved.
//

#import "GHNetworkResponse.h"

@implementation GHNetworkResponse

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
