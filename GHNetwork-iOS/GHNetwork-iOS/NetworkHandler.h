//
//  NetworkHandler.h
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHNetwork/GHNetworkHandleDelegate.h>

NS_ASSUME_NONNULL_BEGIN

/**
 基于业务层的统一处理
 1. Http header 传参
 2. Reponse 解析
 3. 异常code处理
 4. log打印
 */
@interface NetworkHandler : NSObject <GHNetworkHandleDelegate>

+ (instancetype)handler;

@end

NS_ASSUME_NONNULL_END
