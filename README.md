# GHNetwork
### 简介
依赖[AFNetworking](https://github.com/AFNetworking/AFNetworking)(3.2.1), 继承自[YTKNetwork](https://github.com/yuantiku/YTKNetwork)的网络组件。由于`YTKNetwork`不再维护，修改源码适配Https可能出现的闪退
。
### 安装要求

```Swift
iOS 11.0

pod 'GHNetwork', '1.0.0'
```
### 文件结构

```Swift
"GHNetworkHandleDelegate.h" // 业务处理代理
"GHNetworkConfig.h" // 配置
"GHNetworkManager.h" // 管理
"GHNetworkRequest.h" // 请求类
"GHNetworkResponse.h" // 返回数据
```
### 使用
#### 定义处理类
实现`GHNetworkHandleDelegate`
```Swift
NetworkHandler类

基于业务层的统一处理
 1. Http header 传参
 2. Reponse 解析
 3. 异常code处理
 4. log打印
```
#### 启动配置

```Swift
# Appdelegate.m
#import <GHNetwork/GHNetworkConfig.h>
#import <GHNetwork/GHNetworkManager.h>
#import "NetworkHandler.h"

GHNetworkConfig *config = [GHNetworkConfig new];
config.baseUrl = @"http://192.168.16.197:9093/";
// config.securityPolicy = []; // https设置
[[GHNetworkManager sharedManager] addConfig:config];
[[GHNetworkManager sharedManager] configHandleDelegate:[NetworkHandler handler]];
```
#### 请求类

```Swift
# TestRequest.m

- (NSString *)requestUrl; // 请求url 

// 请求方法
- (YTKRequestMethod)requestMethod //  默认为Post

// 超时时间
- (NSTimeInterval)requestTimeoutInterval  //  默认15

// 请求body
- (id)requestArgument 
```

