//
//  SettingsCheckBoxCell.m
//  TEACCHMe
//
//  Created by Michael Gu on 12/17/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import "SettingsCheckBoxCell.h"
#import "M13Checkbox.h"

@implementation SettingsCheckBoxCell
NSManagedObjectContext *_localContext;
UIButton *_checkbox;
BOOL checkBoxSelected;

- (void)awakeFromNib {
    
    self.checked = checkBoxSelected;
    if(self.checked){
        [_checkbox setSelected:YES];
    }
    
    [self.descriptionTextView setDelegate:self];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    
    //Checkbox
    M13Checkbox *box = [[M13Checkbox alloc] initWithFrame:CGRectMake(75,100, 110, 110) title:@"" checkHeight:110];
    box.tintColor = [UIColor colorWithRed: 0.608 green: 0.967 blue: 0.646 alpha: 1];
    
    [self addSubview:box];
}

-(void)textViewDidChange:(UITextView *)textView{
    
    NSString *name = self.descriptionTextView.text;
    self.item.name = name;
}

-(void)saveImage{
    self.item.image = UIImageJPEGRepresentation( self.imageView.image, 1);
}

-(void)checkboxSelected:(id)sender
{
    checkBoxSelected = !checkBoxSelected;
    [_checkbox setSelected:checkBoxSelected];
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        if(checkBoxSelected){
            self.item.checked = [NSNumber numberWithBool:YES];
        }else{
            self.item.checked = [NSNumber numberWithBool:NO];
        }
    }];
    
}

@end
