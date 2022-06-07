//
//  NetworkHandler.h
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GHNetwork/GHNetworkHandleDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@class AFSecurityPolicy;

/**
 基于业务层的统一处理
 1. Http header 传参
 2. Reponse 解析
 3. 异常code处理
 4. log打印
 */
@interface NetworkHandler : NSObject <GHNetworkHandleDelegate>

+ (instancetype)handler;

/// https校验
- (AFSecurityPolicy *)fetchSecurityPolicy;

- (NSDictionary <NSString *, NSString *> *)basicHeaders;

- (NSDictionary <NSString *, NSString *> *)verifyHeaders;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
