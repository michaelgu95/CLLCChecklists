//
//  UseCheckBoxCell.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/15/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UseCheckBoxCell : UICollectionViewCell

@property(retain, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextView*descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) CheckListItem *item;
@property(nonatomic)BOOL checked;

@end
