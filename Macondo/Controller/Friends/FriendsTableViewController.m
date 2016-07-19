//
//  FriendsTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FriendsTableViewController.h"

@interface FriendsTableViewController()<UISearchResultsUpdating>
{
    UISearchController  *searchCtler;
    NSMutableArray      *dataSourceArr;
    NSMutableArray      *searchResultArr;
}

@end

@implementation FriendsTableViewController

- (void)viewDidLoad {

    searchCtler = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchCtler.searchResultsUpdater = self;
    searchCtler.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    
    self.tableView.tableHeaderView = searchCtler.searchBar;
    
    dataSourceArr = [NSMutableArray arrayWithArray:@[@"100", @"200", @"300"]];
    searchResultArr = [[NSMutableArray alloc] init];
}

- (void)filterContentForSearchText:(NSString *)searchText withText:(NSString *)scope {
    
    [searchResultArr removeAllObjects];
    for (NSString *target in dataSourceArr) {
        if ([target containsString:searchText]) {
            [searchResultArr addObject:target];
        }
    }
    [self.tableView reloadData];
}

#pragma mark - TabelViewDelegate && TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        return searchResultArr.count;
    }
    return dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"FriendsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", searchResultArr[indexPath.row]];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", dataSourceArr[indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
 
    [self filterContentForSearchText:searchController.searchBar.text withText:nil];
}

@end
