//
//  GHNetworkManager.h
//  AFNetworking
//
//  Created by kuroky on 2019/1/14.
//

#import <Foundation/Foundation.h>
#import "GHNetworkHandleDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@class GHNetworkConfig;

/**
 网络层配置
 */
@interface GHNetworkManager : NSObject

/**
 网络配置单例

 @return EMNetworkManager
 */
+ (instancetype)sharedManager;

/**
 设置域名地址 如: https://yf.emucoo.net, http://192.168.16.185:9093

 @param config 配置
 */
- (void)addConfig:(GHNetworkConfig *)config;

/**
 设置异常处理代理对象 (为单例)

 @param delegate delegate对象
 */
- (void)configHandleDelegate:(id <GHNetworkHandleDelegate>)delegate;

/**
 异常处理代理对象 
 */
@property (nonatomic, weak, readonly) id <GHNetworkHandleDelegate> handleDelegate;

@end

NS_ASSUME_NONNULL_END
