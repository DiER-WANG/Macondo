//
//  AudioPlayManager.h
//  Macondo
//
//  Created by wangchangyang on 16/9/22.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AudioPlayManagerDelegate <NSObject>

@optional
- (void)audioPlayManagerTimeChanged:(double)time;

@end


@interface AudioPlayManager : NSObject

@property(nonatomic, weak) id<AudioPlayManagerDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)playMusic:(NSString *)urlStr;
- (void)pauseOrPlay;

- (void)next;
- (void)previous;

- (void)join;
- (void)exit;

@end
