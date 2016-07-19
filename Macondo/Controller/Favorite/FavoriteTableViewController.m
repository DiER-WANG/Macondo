//
//  FavoriteTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/18.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "FavoriteTableViewController.h"

@interface FavoriteTableViewController() <UISearchResultsUpdating, UISearchBarDelegate>
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
    searchCtler.searchResultsUpdater = self;// conforms to the new protocol UISearchResultsUpdating
    searchCtler.dimsBackgroundDuringPresentation = NO; // 当置为 YES 时，会有灰色遮罩，效果不是很明显
    self.definesPresentationContext = YES; //ensure that the search bar does not remain on the screen if the user navigates to another view controller while the UISearchController is active.
    
    self.tableView.tableHeaderView = searchCtler.searchBar;
    
    dataSourceArr = [NSMutableArray arrayWithArray:@[@"hello", @"world", @"hey", @"hah", @"hell"]];// 测试数据
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSString *targetString = @"Hello, Welcome to Macondo!";
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
    
        targetString = filterResultArr[selectedIndexPath.row];
    } else {
        targetString = dataSourceArr[selectedIndexPath.row];
    }
    
    UIViewController *destVC = segue.destinationViewController;
    
    destVC.title = targetString;
}

#pragma mark - TableViewDelegate && TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
    
        return filterResultArr.count;
    }
    
    return dataSourceArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *targetString = @"Hello, Welcome to Macondo!";
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        
        targetString = filterResultArr[indexPath.row];
    } else {
        targetString = dataSourceArr[indexPath.row];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"LikesCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    UILabel *titleLabel = [cell viewWithTag:10];
    UILabel *accountLabel = [cell viewWithTag:11];
    
    titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        accountLabel.text = filterResultArr[indexPath.row];
    } else {
        accountLabel.text = [[NSString alloc] initWithFormat:@"%@", dataSourceArr[indexPath.row]];
    }
    
    return cell;
}

#pragma mark - UISearchResultsUpdating 代理方法
// 当 UISearchBar 中的 text 发生变化时，会调用该方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
  
    UISearchBar *searchBar = searchController.searchBar;
    [self filterContentForSearchText:searchBar.text withScope:@"暂未使用到"];
}

@end
