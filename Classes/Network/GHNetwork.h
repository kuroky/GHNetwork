//
//  GHNetwork.h
//  Pods
//
//  Created by kuroky on 2019/6/21.
//

#import <Foundation/Foundation.h>

#if __has_include(<GHNetwork/GHNetwork.h>)
#import <GHNetwork/GHNetworkHandleDelegate.h>
#import <GHNetwork/GHNetworkConfig.h>
#import <GHNetwork/GHNetworkManager.h>
#import <GHNetwork/GHNetworkRequest.h>
#import <GHNetwork/GHNetworkResponse.h>
#else
#import "GHNetworkHandleDelegate.h"
#import "GHNetworkConfig.h"
#import "GHNetworkManager.h"
#import "GHNetworkRequest.h"
#import "GHNetworkResponse.h"
#endif /* GHNetwork_h */
