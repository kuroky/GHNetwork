//
//  TestRequest.m
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import "TestRequest.h"

@implementation TestRequest

- (NSString *)requestUrl {
    return @"/api/index/login";
}

// 默认为Post
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

// 默认15
- (NSTimeInterval)requestTimeoutInterval {
    return 15;
}

- (id)requestArgument {
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setValue:_mobile forKey:@"mobile"];
    [para setValue:_password forKey:@"password"];
    [para setValue:@"" forKey:@"pushToken"];
    return @{@"data": para};
}

@end
