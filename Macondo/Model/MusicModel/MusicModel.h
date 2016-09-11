//
//  MusicModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface MusicModel : NSObject

@property (nonatomic, assign) long long bitrate;
@property (nonatomic, assign) long long playTime;
@property (nonatomic, assign) long long dfsId;
@property (nonatomic, assign) long long sr;
@property (nonatomic, assign) long long volumeDelta;
@property (nonatomic, copy) NSString    *name;

@property (nonatomic, assign) long long musicId;// id
@property (nonatomic, assign) long long size;

@property (nonatomic, copy) NSString    *extension;

@end
