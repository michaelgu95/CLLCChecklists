//
//  UseCheckBoxCell.m
//  TEACCHMe
//
//  Created by Michael Gu on 12/15/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import "UseCheckBoxCell.h"
#import "AppDelegate.h"
#import "M13Checkbox.h"

@implementation UseCheckBoxCell
NSManagedObjectContext *_localContext;
UIButton *_checkbox;
BOOL checkBoxSelected;


- (void)awakeFromNib {
    // Initialization code
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
    
    //Checkbox
    M13Checkbox *box = [[M13Checkbox alloc] initWithFrame:CGRectMake(75,100, 100, 100) title:@"" checkHeight:110];
    box.tintColor = [UIColor colorWithRed: 0.608 green: 0.967 blue: 0.646 alpha: 1];
    
    [self addSubview:box];
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
