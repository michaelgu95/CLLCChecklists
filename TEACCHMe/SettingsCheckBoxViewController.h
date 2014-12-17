//
//  SettingsCheckBoxViewController.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/17/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKImagePicker.h"

@interface SettingsCheckBoxViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate, GKImagePickerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) int numberOfCells;
@property (nonatomic) CheckList *checkList;
@property(nonatomic, strong) NSString *nameOfCheckList;

//GKProperties
@property (nonatomic, strong) GKImagePicker *imagePicker;
@property (nonatomic, strong) UIPopoverController *popoverController;
@property (nonatomic, strong) UIImagePickerController *ctr;

@end
