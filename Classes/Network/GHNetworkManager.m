//
//  GHNetworkManager.m
//  AFNetworking
//
//  Created by kuroky on 2019/1/14.
//

#import "GHNetworkManager.h"
#import "GHNetworkConfig.h"

#if __has_include(<YTKNetwork/YTKNetworkConfig.h>)
#import <YTKNetwork/YTKNetworkConfig.h>
#else
#import "YTKNetworkConfig.h"
#endif


@interface GHNetworkManager ()

@property (nonatomic, weak, readwrite) id <GHNetworkHandleDelegate> handleDelegate;

@end

@implementation GHNetworkManager

+ (instancetype)sharedManager {
    static GHNetworkManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [GHNetworkManager new];
    });
    return manager;
}

- (void)addConfig:(GHNetworkConfig *)config {
    YTKNetworkConfig *ytkConfig = [YTKNetworkConfig sharedConfig];
    ytkConfig.baseUrl = config.baseUrl;
    if (config.securityPolicy) {
        ytkConfig.securityPolicy = config.securityPolicy;
    }
}

- (void)configHandleDelegate:(id <GHNetworkHandleDelegate>)delegate {
    _handleDelegate = delegate;
}

@end

