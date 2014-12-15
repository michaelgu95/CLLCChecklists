//
//  UseCheckBoxViewController.m
//  TEACCHMe
//
//  Created by Michael Gu on 12/14/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import "UseCheckBoxViewController.h"
#import "CheckBoxViewController.h"
#import "CheckBoxCell.h"
#import "UseCheckBoxCell.h"

@interface UseCheckBoxViewController ()


@end

@implementation UseCheckBoxViewController
CheckList *_checkList;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.checkList = [CheckList MR_findFirstByAttribute:@"name" withValue:self.nameOfCheckList];
    
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkgray.png"]];
    
    UINib *checkBoxCellNib = [UINib nibWithNibName:@"UseCheckBoxCell" bundle:nil];
    [self.collectionView registerNib:checkBoxCellNib forCellWithReuseIdentifier:@"useCheckBoxCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(800, 300)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    _checkList = self.checkList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return self.numberOfCells;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)view cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UseCheckBoxCell *cell = [view dequeueReusableCellWithReuseIdentifier: @"useCheckBoxCell" forIndexPath:indexPath];
    
    NSArray *sortDescriptors = [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
    
    NSArray *sortedCheckListItems = [[_checkList.checkListItem allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    
    CheckListItem *item = [sortedCheckListItems objectAtIndex:indexPath.item];
    cell.item = item;
    cell.descriptionTextView.text = item.name;
    cell.backgroundColor = [UIColor whiteColor];
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
