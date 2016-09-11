//
//  SquareCollectionViewController.m
//  Macondo
//
//  Created by wangchangyang on 16/7/22.
//  Copyright © 2016年 wangchangyang. All rights reserved.
//

#import "SquareCollectionViewController.h"
#import "SourceManager.h"
#import <AVFoundation/AVFoundation.h>

#import "SquareCollectionViewCell.h"

@interface SquareCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *musicArr;

@end

@implementation SquareCollectionViewController

static NSString * const reuseIdentifier = @"AlbumCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _musicArr = [NSMutableArray array];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:btn];
    btn.center = self.view.center;
    [btn setBackgroundColor:[UIColor redColor]];
    
    [btn addTarget:self action:@selector(getAlbumBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)getAlbumBtnClick:(UIButton *)btn {
    
    __weak typeof(self) weakSelf = self;
    [[SourceManager sharedInstance] getAlbum:@(2801259) withResultBlock:^(AlbumModel *album) {
        if (album) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            
            [_musicArr addObjectsFromArray:album.songs];
            [strongSelf.collectionView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _musicArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SquareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    UILabel *label = [cell viewWithTag:10];
    
    label.text = [_musicArr[indexPath.row] name];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
