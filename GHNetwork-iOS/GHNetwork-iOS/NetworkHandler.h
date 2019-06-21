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

@interface NetworkHandler : NSObject <GHNetworkHandleDelegate>

+ (instancetype)handler;

@end

NS_ASSUME_NONNULL_END
