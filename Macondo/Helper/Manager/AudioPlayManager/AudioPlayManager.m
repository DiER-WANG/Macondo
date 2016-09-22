//
//  AudioPlayManager.m
//  Macondo
//
//  Created by wangchangyang on 16/9/22.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "AudioPlayManager.h"
#import "STKAudioPlayer.h"


@interface AudioPlayManager()

@property (nonatomic, strong) STKAudioPlayer *player;

@end

@implementation AudioPlayManager

+ (instancetype)sharedInstance {
    
    static AudioPlayManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
        singleton.player = [[STKAudioPlayer alloc] init];
    });
    return singleton;
}

- (void)playMusic:(NSString *)urlStr {
    [_player playURL:[NSURL URLWithString:urlStr]];
}
- (void)pauseOrPlay {
    if (_player.state == STKAudioPlayerStatePaused) {
        [_player resume];
    } else {
        [_player pause];
    }
}

- (void)next {
    
}
- (void)previous {
    
}

- (void)join {
    
}
- (void)exit {
    
}

@end
