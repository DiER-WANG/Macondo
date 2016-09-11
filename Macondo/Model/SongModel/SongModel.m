//
//  SongModel.m
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "SongModel.h"

@implementation SongModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"songCopyFrom": @"copyFrom",
             @"songId": @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"artists": @"ArtistModel"};
}

@end
