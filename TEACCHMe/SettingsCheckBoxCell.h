//
//  SettingsCheckBoxCell.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/17/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsCheckBoxCell : UICollectionViewCell <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *pickImageButton;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) CheckListItem *item;
@property(nonatomic)BOOL checked;

-(void)saveImage;
@end
