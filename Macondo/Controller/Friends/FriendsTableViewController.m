//
//  FriendsTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FriendsTableViewController.h"

@implementation FriendsTableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title = @"Hello, Welcome to Macondo!";

    return title = @"来自社交账号好友";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"FriendsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    return cell;
}



@end
