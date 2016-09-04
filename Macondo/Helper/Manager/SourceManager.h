//
//  SourceManager.h
//  Macondo
//
//  Created by wangchangyang on 16/9/4.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SourceManager : NSObject

+ (instancetype)sharedInstance;

- (NSString *)getSongById:(NSString *)songId;

@end
