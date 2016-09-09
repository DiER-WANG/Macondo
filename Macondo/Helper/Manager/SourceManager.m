//
//  SourceManager.m
//  Macondo
//
//  Created by wangchangyang on 16/9/4.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "SourceManager.h"
#import "AFNetworking.h"
#import "ServerURL.h"

@interface SourceManager()

@property (nonatomic, strong) AFHTTPSessionManager *httpManager;

@end



@implementation SourceManager

+ (instancetype)sharedInstance {
    static SourceManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });    
    return singleton;
}

- (void)getAlbum:(NSNumber *)albumId withResultBlock:(void(^)(NSDictionary *albumInfo))resultBlock {

    NSString *targetURLStr = [TEST_SERVER_URL stringByAppendingString:TEST_SERVER_ALBUM];
    
    NSString *urlStr = [NSString stringWithFormat:targetURLStr, [albumId unsignedIntegerValue]];
    
    [self.httpManager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error = nil;
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options: NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSLog(@"____%s__ERROR__%@", __func__, error);
        }
        
        if (dict) {
            resultBlock(dict);
        } else {
            resultBlock(nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        resultBlock(nil);
    }];
}


- (AFHTTPSessionManager *)httpManager {
    
    if (!_httpManager) {
        
        _httpManager = [AFHTTPSessionManager manager];
        // "Content-Type" = "text/html; charset=utf-8" 改为 application／json;
        _httpManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    return _httpManager;
}

@end
