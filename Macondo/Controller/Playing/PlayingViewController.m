//
//  PlayingViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/15.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "PlayingViewController.h"
#import "AudioPlayManager.h"

@implementation PlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_song) {
        [[AudioPlayManager sharedInstance] playMusic:_song.mp3Url];
    }
}

- (IBAction)listenFollow:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    if (_song) {
        [[AudioPlayManager sharedInstance] pauseOrPlay];
    }    
}

/** 分享当前音乐 */
- (IBAction)share:(UIButton *)sender {
}

/** 收藏当前音乐 */
- (IBAction)like:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
}

@end
