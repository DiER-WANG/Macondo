//
//  ListenersTableViewController.m
//  Macondo
//
//  Created by 王昌阳 on 2016/9/25.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "ListenersTableViewController.h"

@interface ListenersTableViewController ()

@end

@implementation ListenersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"主播";
    } else {
        return @"听众";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"ListenersCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", indexPath.section == 0 ? @"Kobe Brayant" : @"LeBron James"];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
