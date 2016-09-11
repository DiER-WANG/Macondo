//
//  SourceManager.h
//  Macondo
//
//  Created by wangchangyang on 16/9/4.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumModel.h"

@interface SourceManager : NSObject

+ (instancetype)sharedInstance;

/** 获取专辑信息 */
- (void)getAlbum:(NSNumber *)albumId withResultBlock:(void(^)(AlbumModel *album))resultBlock;



@end
