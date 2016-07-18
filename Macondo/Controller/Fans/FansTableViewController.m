//
//  FansTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FansTableViewController.h"

@implementation FansTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
    }
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        return 1;
    }
    
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        
        static NSString *ident = @"FansSearchCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
        
        return cell;
    }
    
    static NSString *ident = @"FansCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    UILabel *nickLabel = [cell viewWithTag:10];
    UILabel *songTitle = [cell viewWithTag:11];
    
    nickLabel.text = [NSString stringWithFormat:@"%@ %ld", nickLabel.text, indexPath.row];
    songTitle.text = [NSString stringWithFormat:@"%@ %ld", songTitle.text, indexPath.row];
    
    return cell;
}

@end
