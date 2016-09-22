//
//  UserModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/22.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongModel.h"

@interface UserModel : NSObject

@property (nonatomic, strong) NSArray *listeners;
@property (nonatomic, strong) SongModel *playingSong;
@property (nonatomic, assign) double playingTime;

@end
