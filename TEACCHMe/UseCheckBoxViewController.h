//
//  UseCheckBoxViewController.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/14/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CheckList;
@class CheckListItem;

@interface UseCheckBoxViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) CheckList *checkList;
@property(nonatomic, strong) NSString *nameOfCheckList;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) int numberOfCells;


@end
