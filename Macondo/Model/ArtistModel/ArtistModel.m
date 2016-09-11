//
//  ArtistModel.m
//  Macondo
//
//  Created by wangchangyang on 16/9/11.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "ArtistModel.h"

@implementation ArtistModel

+ (NSDictionary *)modelCustomPropertyMapper {
    
    return @{@"artistId": @"id"};
}


@end
