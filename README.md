# GHNetwork
### 简介

![提示](Resource/2020-10-14.png)

### 安装要求

```
iOS 11.0

pod 'Ghidrah', :git => 'ssh://git@192.168.16.172:7999/em/ghidrah.git' // 位于本地服务器
```

### 文件结构

```
"Classes/Model/" // 业务处理代理
"Classes/HUD" // 配置
"Classes/Category" // 管理
"Classes/Tool" // 请求类
"CocoaLumberjack" // 返回数据
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

```
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

```
# TestRequest.m

- (NSString *)requestUrl; // 请求url 

// 请求方法
- (YTKRequestMethod)requestMethod //  默认为Post

// 超时时间
- (NSTimeInterval)requestTimeoutInterval  //  默认15

// 请求body
- (id)requestArgument 
```

