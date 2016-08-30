//
//  AccountManager.m
//  Macondo
//
//  Created by wangchangyang on 16/8/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "AccountManager.h"
#import "AFNetworking.h"
#import "Server.h"
#import <AVFoundation/AVFoundation.h>


static AccountManager *singleton = nil;


@interface AccountManager()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation AccountManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (void)loginAccount:(NSString *)account password:(NSString *)password success:(void(^)())success failure:(void(^)())failure {
    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setObject:account forKey:@"account"];
    [para setObject:password forKey:@"password"];
    
    [self.manager POST:[NSString stringWithFormat:@"%@%@", TEST_SERVER_URL, TEST_LOGIN_URL] parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        
        NSLog(@"login...%@", uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"success...%@", [responseObject[@"loginResult"] stringByRemovingPercentEncoding]);
        success();
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"failure...%@", error);
        failure();
    }];
}

- (void)registerAccount:(NSString *)account password:(NSString *)password success:(void(^)())success failure:(void(^)())failure {
    
}

- (AFHTTPSessionManager *)manager {
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

@end
