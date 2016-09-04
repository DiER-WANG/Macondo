//
//  SourceManager.m
//  Macondo
//
//  Created by wangchangyang on 16/9/4.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "SourceManager.h"
#import "AFNetworking.h"
#import "Server.h"

@implementation SourceManager

+ (instancetype)sharedInstance {
    static SourceManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });    
    return singleton;
}

- (NSString *)getSongById:(NSString *)songId {
    
    return @"http://m2.music.126.net/CQYcIH8hy7MKNyqBLHlt1g==/1074222860345947.mp3";
}


@end
