//
//  GHNetworkConfig.h
//  AFNetworking
//
//  Created by kuroky on 2019/5/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AFSecurityPolicy;

/**
 网络配置
 */
@interface GHNetworkConfig : NSObject

/**
 设置域名地址 如: http://192.168.16.185:9093
 */
@property (nonatomic, copy) NSString *baseUrl;

/**
 https 设置
 */
@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;

@end

NS_ASSUME_NONNULL_END
