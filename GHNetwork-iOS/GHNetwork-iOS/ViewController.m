//
//  ViewController.m
//  GHNetwork-iOS
//
//  Created by kuroky on 2019/6/21.
//  Copyright © 2019 Emucoo. All rights reserved.
//

#import "ViewController.h"
#import "TestRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sendRequest];
}

- (void)sendRequest {
    TestRequest *request = [TestRequest new];
    request.mobile = @"shida1";
    request.password = @"e10adc3949ba59abbe56e057f20f883e";
    [request gh_requestWithCompletion:^(GHNetworkResponse *response) {
        if (response.isSuccess) {
            NSLog(@"success");
            NSLog(@"%@", response.respData);
        }
        else {
            NSLog(@"fail");
        }
    }];
}


@end
