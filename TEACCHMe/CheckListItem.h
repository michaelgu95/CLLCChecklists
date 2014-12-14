//
//  CheckListItem.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/13/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckList;

@interface CheckListItem : NSManagedObject

@property (nonatomic, retain) NSNumber * checked;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) CheckList *checkList;

@end
