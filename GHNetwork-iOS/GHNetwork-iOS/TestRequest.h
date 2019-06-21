//
//  TestRequest.h
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import <GHNetwork/GHNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestRequest : GHNetworkRequest

/**
 手机号
 */
@property (nonatomic, copy) NSString *mobile;

/**
 登录密码 + md5
 */
@property (nonatomic, copy) NSString *password;

/**
 devicetoken
 */
@property (copy, nonatomic) NSString *pushToken;

@end

NS_ASSUME_NONNULL_END
