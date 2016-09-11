//
//  AlbumModel.m
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

+ (NSDictionary *)modelCustomPropertyMapper {

    return @{@"albumDescription": @"description",
             @"albumId": @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"songs": @"SongModel",
             @"artists": @"ArtistModel"};
}

@end
