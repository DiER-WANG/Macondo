//
//  AlbumModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "YYModel.h"

@class ArtistModel, AlbumInfoModel, SongModel;

@interface AlbumModel : NSObject

@property (nonatomic, strong) NSArray *songs;// SongModel

@property (nonatomic, assign) BOOL paid;

@property (nonatomic, assign) BOOL onSale;

@property (nonatomic, copy) NSString *briefDesc;

@property (nonatomic, assign) long long copyrightId;

@property (nonatomic, strong) ArtistModel *artist;

@property (nonatomic, strong) NSString *commentThreadId;

@property (nonatomic, assign) long long picId;

@property (nonatomic, strong) NSArray *artists;// ArtistModel

@property (nonatomic, assign) long long publishTime;

@property (nonatomic, copy) NSString *company;

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, copy) NSString *blurPicUrl;

@property (nonatomic, assign) long long companyId;

@property (nonatomic, assign) long long pic;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) long long status;

@property (nonatomic, copy) NSString *albumDescription;// description

@property (nonatomic, copy) NSString *subType;

@property (nonatomic, strong) NSArray *alias;// NSString

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) long long albumId;// id

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) long long size;

@property (nonatomic, strong) AlbumInfoModel *info;

@end
