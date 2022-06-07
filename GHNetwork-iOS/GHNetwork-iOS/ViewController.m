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

@property (nonatomic, strong) UIActivityIndicatorView *hud;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 200, 120, 40);
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.hud = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(230, 205, 30, 30)];
    [self.view addSubview:self.hud];
}

- (void)start {
    [self sendRequest];
}

- (void)sendRequest {
    [self.hud startAnimating];
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
        [self.hud stopAnimating];
    }];
}


@end
