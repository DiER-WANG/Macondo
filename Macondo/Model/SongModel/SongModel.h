//
//  SongModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@class AlbumModel, MusicModel, ArtistModel;

@interface SongModel : NSObject

@property (nonatomic, assign) BOOL starred;
@property (nonatomic, assign) long long popularity;
@property (nonatomic, assign) long long starredNum;
@property (nonatomic, assign) long long playedNum;
@property (nonatomic, assign) long long dayPlays;
@property (nonatomic, assign) long long hearTime;
@property (nonatomic, copy  ) NSString  *mp3Url;
@property (nonatomic, copy  ) NSString  *rtUrls;
@property (nonatomic, assign) long long copyrightId;

@property (nonatomic, assign) long long score;

@property (nonatomic, strong) AlbumModel *album;

@property (nonatomic, copy) NSString *commentThreadId;
@property (nonatomic, copy) NSString *songCopyFrom;//copyFrom

@property (nonatomic, strong) MusicModel *hMusic;
@property (nonatomic, strong) MusicModel *mMusic;
@property (nonatomic, strong) MusicModel *IMusic;
@property (nonatomic, strong) MusicModel *bMusic;

@property (nonatomic, strong) NSArray *artists;// ArtistModel

@property (nonatomic, assign) long long mvid;
@property (nonatomic, assign) long long fee;
@property (nonatomic, assign) long long ftype;
@property (nonatomic, assign) long long rtype;

@property (nonatomic, copy) NSString  *rurl;
@property (nonatomic, copy) NSString  *crbt;

@property (nonatomic, copy) NSString *rtUrl;

@property (nonatomic, assign) long long position;
@property (nonatomic, assign) long long duration;
@property (nonatomic, assign) long long status;

@property (nonatomic, copy) NSString    *audition;
@property (nonatomic, copy) NSString    *ringtone;
@property (nonatomic, copy) NSString    *disc;

@property (nonatomic, assign) long long   no;

@property (nonatomic, strong) NSArray *alias;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) long long songId;// id

@end
