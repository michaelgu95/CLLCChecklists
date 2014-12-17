//
//  SettingsCheckBoxViewController.m
//  TEACCHMe
//
//  Created by Michael Gu on 12/17/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import "SettingsCheckBoxViewController.h"
#import "SettingsCheckBoxCell.h"
#import "MBProgressHUD.h"
#import "GKImagePicker.h"
#import "UseCheckBoxViewController.h"
#import "CheckBoxCell.h"

@interface SettingsCheckBoxViewController ()

@end

@implementation SettingsCheckBoxViewController
@synthesize popoverController;
int _numberOfCells;
SettingsCheckBoxCell *_cellInUse;
CheckList *_checkList;
BOOL _addingMore;

- (void)viewDidLoad {
    [super viewDidLoad];
    _addingMore = false;
    
    _checkList = self.checkList;
    _numberOfCells = (int)[self.checkList.checkListItem count];
    NSLog(@"%d", _numberOfCells);

    self.titleTextField.text = self.checkList.name;
    [self.titleTextField setDelegate:self];
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"darkgray.png"]];


    UINib *settingsCheckBoxCellNib = [UINib nibWithNibName:@"SettingsCheckBoxCell" bundle:nil];
    [self.collectionView registerNib:settingsCheckBoxCellNib forCellWithReuseIdentifier:@"settingsCheckBoxCell"];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(800, 300)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.titleTextField];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButtonPressed:(id)sender {
    _numberOfCells++;
    _addingMore = YES;
    [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:_numberOfCells-1 inSection:0]]];
}
- (IBAction)saveButtonPressed:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Saved!";
    //    hud.mode = MBProgressHUDAnimationZoomOut;
    [hud hide:YES afterDelay:1.4];
    NSLog(@"%@", self.checkList.name);
}

- (void)textFieldDidChange:(NSNotification *)notification {
    self.checkList.name = self.titleTextField.text;
}

#pragma mark - UICollectionViewDatasource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section{
    return _numberOfCells;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)view cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(_addingMore){
        
        UINib *checkBoxCellNib = [UINib nibWithNibName:@"CheckBoxCell" bundle:nil];
        [self.collectionView registerNib:checkBoxCellNib forCellWithReuseIdentifier:@"settingsCheckBoxCell"];
        
        CheckBoxCell *cell = [view dequeueReusableCellWithReuseIdentifier: @"settingsCheckBoxCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
    
        cell.item.CheckList = self.checkList;
        [cell.pickImageButton addTarget:self action:@selector(showResizablePicker:) forControlEvents:UIControlEventTouchUpInside];
        [cell.pickImageButton addTarget:self action:@selector(useThisCell:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

        
    }else{
    
        SettingsCheckBoxCell *cell = [view dequeueReusableCellWithReuseIdentifier: @"settingsCheckBoxCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        cell.item.CheckList = self.checkList;
    
        NSArray *sortDescriptors = [NSArray arrayWithObject: [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
        NSArray *sortedCheckListItems = [[_checkList.checkListItem allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    
        CheckListItem *item = [sortedCheckListItems objectAtIndex:indexPath.item];
        cell.item = item;
        cell.descriptionTextView.text = item.name;
        cell.imageView.image = [[UIImage alloc]initWithData:item.image];
        cell.checked = item.checked;

        [cell.pickImageButton addTarget:self action:@selector(showResizablePicker:) forControlEvents:UIControlEventTouchUpInside];
        [cell.pickImageButton addTarget:self action:@selector(useThisCell:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}

#pragma mark - selectors for pickImageButton

-(void)useThisCell:(id)sender{
    _cellInUse = (SettingsCheckBoxCell *)[[sender superview] superview];
    _cellInUse.pickImageButton.hidden = YES;
}

-(void)showResizablePicker:(UIButton*)btn{
    _cellInUse.pickImageButton.hidden = YES;
    self.imagePicker = [[GKImagePicker alloc] init];
    self.imagePicker.cropSize = CGSizeMake(240, 200);
    self.imagePicker.delegate = self;
    self.imagePicker.resizeableCropArea = YES;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        self.popoverController = [[UIPopoverController alloc] initWithContentViewController:self.imagePicker.imagePickerController];
        [self.popoverController presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        
        [self presentViewController:self.imagePicker.imagePickerController animated:YES completion:nil];
        
    }
}

# pragma mark -
# pragma mark GKImagePicker Delegate Methods

- (void)imagePicker:(GKImagePicker *)imagePicker pickedImage:(UIImage *)image{
    _cellInUse.imageView.image = image;
    [self hideImagePicker];
    [_cellInUse saveImage];
}

- (void)hideImagePicker{
    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM()) {
        
        [self.popoverController dismissPopoverAnimated:YES];
        
    } else {
        
        [self.imagePicker.imagePickerController dismissViewControllerAnimated:YES completion:nil];
        
    }
}

# pragma mark -
# pragma mark UIImagePickerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    _cellInUse.imageView.image = image;
    
    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM()) {
        
        [self.popoverController dismissPopoverAnimated:YES];
        
    } else {
        
        [picker dismissViewControllerAnimated:YES completion:nil];
        
    }
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"cancel"]){
        UseCheckBoxViewController *vc = [segue destinationViewController];
        vc.nameOfCheckList = self.checkList.name;
    }
}


@end
