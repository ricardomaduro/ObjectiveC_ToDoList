//
//  MyUITableViewCell.h
//  ToDoManager
//
//  Created by Ricardo Maduro on 29/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"

@interface MyUITableViewCell : UITableViewCell
@property (strong, nonatomic) ToDoEntity *localToDoEntity;
@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDueDateLabel;



- (void) setInternalFields: (ToDoEntity *) incomingToDoEntity;

@end
