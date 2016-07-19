//
//  FansTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FansTableViewController.h"

@interface FansTableViewController()<UISearchResultsUpdating>
{
    UISearchController  *searchCtler;
    NSMutableArray      *dataSourceArr;
    NSMutableArray      *searchResultArr;
}

@end

@implementation FansTableViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    searchCtler = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchCtler.searchResultsUpdater = self;
    searchCtler.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    self.tableView.tableHeaderView = searchCtler.searchBar;
    
    dataSourceArr = [NSMutableArray arrayWithArray:@[@"h1", @"h2", @"h3", @"h4"]];
    searchResultArr = [[NSMutableArray alloc] init];
}

- (void)filterContentForSearchText:(NSString *)searchText withScope:(NSString *)scope {
    
    [searchResultArr removeAllObjects];
    
    for (NSString *target in dataSourceArr) {
        
        if ([target containsString:searchText]) {
         
            [searchResultArr addObject:target];
        }
    }
    
    [self.tableView reloadData];
}


#pragma mark - TableViewDelegate && TableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

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

    static NSString *ident = @"FansCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    UILabel *nickLabel = [cell viewWithTag:10];
    UILabel *songTitle = [cell viewWithTag:11];
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        nickLabel.text = [NSString stringWithFormat:@"%@ %ld", searchResultArr[indexPath.row], indexPath.row];
    } else {
        nickLabel.text = [NSString stringWithFormat:@"%@ %ld", dataSourceArr[indexPath.row], indexPath.row];
    }
    
    songTitle.text = [NSString stringWithFormat:@"%@ %ld", songTitle.text, indexPath.row];
    return cell;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
 
    [self filterContentForSearchText:searchController.searchBar.text withScope:nil];
}

@end
