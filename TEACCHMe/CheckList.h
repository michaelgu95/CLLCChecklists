//
//  CheckList.h
//  TEACCHMe
//
//  Created by Michael Gu on 12/13/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CheckListItem;

@interface CheckList : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *checkListItem;
@end

@interface CheckList (CoreDataGeneratedAccessors)

- (void)addCheckListItemObject:(CheckListItem *)value;
- (void)removeCheckListItemObject:(CheckListItem *)value;
- (void)addCheckListItem:(NSSet *)values;
- (void)removeCheckListItem:(NSSet *)values;

@end
