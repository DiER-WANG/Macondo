//
//  AccountManager.h
//  Macondo
//
//  Created by wangchangyang on 16/8/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountManager : NSObject

+ (instancetype)sharedInstance;

/**
 *  登录 接口
 *
 *  @param account  账号
 *  @param password 密码
 *  @param success  成功
 *  @param failure  失败
 */
- (void)loginAccount:(NSString *)account password:(NSString *)password success:(void(^)())success failure:(void(^)())failure;

/**
 *  注册 接口
 *
 *  @param account  账号
 *  @param password 密码
 *  @param success  成功
 *  @param failure  失败
 */
- (void)registerAccount:(NSString *)account password:(NSString *)password success:(void(^)())success failure:(void(^)())failure;


@end
