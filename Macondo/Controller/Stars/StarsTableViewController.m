//
//  FriendsTableViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/15.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "StarsTableViewController.h"


@interface StarsTableViewController()<UISearchResultsUpdating, UISearchBarDelegate>
{
    UISearchController  *searchCtler;
    NSMutableArray      *dataSourceArr;
    NSMutableArray      *searchResultArr;
}

@end


@implementation StarsTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    searchCtler = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchCtler.searchResultsUpdater = self;
    searchCtler.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    self.tableView.tableHeaderView = searchCtler.searchBar;
    
    dataSourceArr = [NSMutableArray arrayWithArray:@[
                                                     @"@1", @"@12", @"@123",
                                                     @"@2", @"@23", @"@234",
                                                     ]];

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

#pragma mark - TableViewDataSource && TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"PlaySegue"]) {
        // 播放界面
        UIViewController *destVC = segue.destinationViewController;
        if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
            destVC.title = searchResultArr[self.tableView.indexPathForSelectedRow.row];
        } else {
            destVC.title = dataSourceArr[self.tableView.indexPathForSelectedRow.row];
        }
    } else {
        // 搜索好友界面
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        
        return searchResultArr.count;
    }
    return dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ident = @"FriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    
    UIImageView *avatarImageView = [cell viewWithTag:10];
    UILabel     *nickLabel       = [cell viewWithTag:11];
    UILabel     *playingLabel    = [cell viewWithTag:12];
    
    if (searchCtler.isActive && searchCtler.searchBar.text.length > 0) {
        avatarImageView.backgroundColor = [UIColor orangeColor];
        nickLabel.text = searchResultArr[indexPath.row];
        playingLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    } else {
        avatarImageView.backgroundColor = [UIColor blueColor];
        nickLabel.text = dataSourceArr[indexPath.row];
        playingLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchBarDelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    UISearchBar *searchBar = searchCtler.searchBar;
    [self filterContentForSearchText:searchBar.text withScope:@"暂未未使用"];
}

@end
