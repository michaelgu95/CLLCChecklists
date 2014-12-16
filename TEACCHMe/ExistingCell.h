//
//  ExistingCell.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/15/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExistingCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *smallLabel;
@property (weak, nonatomic) IBOutlet UILabel *bigLabel;
@property(nonatomic) CheckList *checkList;

@end
