//
//  FavoriteTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FavoriteTableViewController.h"

@implementation FavoriteTableViewController


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"LikesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    UILabel *titleLabel = [cell viewWithTag:10];
    titleLabel.text = [titleLabel.text stringByAppendingFormat:@"%ld", indexPath.row];
    
    UILabel *accountLabel = [cell viewWithTag:11];
    accountLabel.text = [[NSString alloc] initWithFormat: @"%ld", indexPath.row];
    
    return cell;
}

@end
