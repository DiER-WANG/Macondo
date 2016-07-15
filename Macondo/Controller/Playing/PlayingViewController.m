//
//  PlayingViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/15.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "PlayingViewController.h"

@implementation PlayingViewController


- (IBAction)listenFollow:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
}

/** 分享当前音乐 */
- (IBAction)share:(UIButton *)sender {
}

/** 收藏当前音乐 */
- (IBAction)like:(UIButton *)sender {
    
    sender.selected = !sender.isSelected;
}

@end
