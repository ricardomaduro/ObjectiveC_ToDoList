//
//  MyUITableViewCell.m
//  ToDoManager
//
//  Created by Ricardo Maduro on 29/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import "MyUITableViewCell.h"

@implementation MyUITableViewCell



- (void) setInternalFields: (ToDoEntity *) incomingToDoEntity {

    self.toDoTitleLabel.text = incomingToDoEntity.toDoTitle;
    self.toDoDueDateLabel.text = incomingToDoEntity.toDoCountry;
    self.localToDoEntity = incomingToDoEntity;
}


@end