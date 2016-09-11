//
//  ArtistModel.h
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

@interface ArtistModel : NSObject

@property (nonatomic, assign) long long img1v1Id;

@property (nonatomic, copy) NSString *briefDesc;

@property (nonatomic, copy) NSString *trans;

@property (nonatomic, assign) long long picId;

@property (nonatomic, assign) long long albumSize;

@property (nonatomic, copy) NSString *img1v1Url;

@property (nonatomic, copy) NSString *picUrl;

@property (nonatomic, assign) long long musicSize;

@property (nonatomic, strong) NSArray *alias;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) long long artistId;

@end
