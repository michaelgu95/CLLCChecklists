//
//  ExistingViewController.m
//  TEACCHMe
//
//  Created by Michael Gu on 12/15/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import "ExistingViewController.h"
#import "ExistingCell.h"
#import "UseCheckBoxViewController.h"

@interface ExistingViewController ()

@end

@implementation ExistingViewController
NSArray *_allCheckLists;
NSUInteger *_checkListCount;
static NSString *const reuseIdentifier = @"existingCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *existingCellNib = [UINib nibWithNibName:@"ExistingCell" bundle:nil];
    [self.collectionView registerNib:existingCellNib forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(330, 280)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:flowLayout];

    
    _allCheckLists = [CheckList MR_findAll];
     _checkListCount = [ _allCheckLists count];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"useCheckList" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"useCheckList"]){
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        UseCheckBoxViewController *vc = [segue destinationViewController];
        CheckList *checkList =[_allCheckLists objectAtIndex:indexPath.item];
        vc.nameOfCheckList = checkList.name;
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   return (NSInteger)_checkListCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ExistingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    CheckList *checkList = [_allCheckLists objectAtIndex:indexPath.item];
    cell.backgroundColor = [UIColor whiteColor];
    cell.checkList = checkList;
    cell.smallLabel.text = checkList.name;
    NSLog(@"%@", checkList.name);
    NSString *bigLetter = [checkList.name substringToIndex:1];
    cell.bigLabel.text = bigLetter;

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
