//
//  UserModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/22.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongModel.h"

typedef NS_ENUM(NSUInteger, Gender) {
    Female,
    Male
};


@interface UserModel : NSObject

/** 当前一起听的人 */
@property (nonatomic, strong) NSArray *listeners;
/** 正在播放的音乐 */
@property (nonatomic, strong) SongModel *playingSong;
/** 播放的时间 */
@property (nonatomic, assign) double playingTime;

/** 用户昵称 */
@property (nonatomic, copy) NSString *userName;
/** 用户 id */
@property (nonatomic, strong) NSNumber *userId;
/** 位置 */
@property (nonatomic, copy) NSString *location;
/** 性别 */
@property (nonatomic, assign) Gender gender;
/** 头像路径 */
@property (nonatomic, copy) NSString *avatarUrl;

/** 账户名 */
@property (nonatomic, copy) NSString *account;
/** 账户密码 */
@property (nonatomic, copy) NSString *password;

/** 自己关注的用户 */
@property (nonatomic, strong) NSArray *stars;
/** 关注自己的用户 */
@property (nonatomic, strong) NSArray *followers;

@end
