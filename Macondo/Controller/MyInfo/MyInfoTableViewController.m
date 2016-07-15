//
//  MyInfoTableViewController.m
//  Macondo
//
//  Created by 王昌阳 on 16/7/16.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "MyInfoTableViewController.h"

@implementation MyInfoTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 3) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        UIButton *loginOutBtn = [(UIButton *)cell viewWithTag:101];
        
        loginOutBtn.selected = !loginOutBtn.isSelected;
    }
    
}





@end
