//
//  FavoriteTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FavoriteTableViewController.h"

@interface FavoriteTableViewController() <UISearchResultsUpdating>
{
    UISearchController  *searchCtler;
    NSMutableArray      *dataSourceArr;
    NSMutableArray      *filterResultArr;
}

@end


@implementation FavoriteTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    searchCtler = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchCtler.searchResultsUpdater = self;
    searchCtler.dimsBackgroundDuringPresentation = NO;
    
    self.definesPresentationContext = YES;
    self.tableView.tableHeaderView = searchCtler.searchBar;
    
    dataSourceArr = [NSMutableArray arrayWithArray:@[@"hello", @"world", @"hey", @"hah", @"hell"]];
    
    filterResultArr = [[NSMutableArray alloc] init];
}

- (void)filterContentForSearchText:(NSString *)searchText withScope:(NSString *)scope {

    
    [filterResultArr removeAllObjects];
    for (NSString *targetString in dataSourceArr) {
        
        if ([targetString containsString:searchText]) {
    
            [filterResultArr addObject:targetString];
        }
    }
    
    [self.tableView reloadData];
}

#pragma mark - TableViewDelegate && TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
    
        return filterResultArr.count;
    }
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"LikesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    UILabel *titleLabel = [cell viewWithTag:10];
    UILabel *accountLabel = [cell viewWithTag:11];
    
    titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
    
        titleLabel.text = filterResultArr[indexPath.row];
        
    } else {
    
        accountLabel.text = [[NSString alloc] initWithFormat: @"%ld", indexPath.row];
    }
    
    return cell;
}

#pragma mark - UISearchResultsUpdating 代理方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
 
    [self filterContentForSearchText:searchController.searchBar.text withScope:@"ALL"];
    
    NSLog(@"searchBar's text:%@", searchController.searchBar.text);
}


@end
