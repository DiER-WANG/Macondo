//
//  AlbumInfoModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumInfoModel : NSObject

@property (nonatomic, strong) NSArray *latestLikesUsers;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, assign) long long resourceType;
@property (nonatomic, assign) long long resourceId;
@property (nonatomic, assign) long long commentCount;
@property (nonatomic, assign) long long shareCount;
@property (nonatomic, assign) long long likedCount;
@property (nonatomic, copy) NSString *threadId;

@end
