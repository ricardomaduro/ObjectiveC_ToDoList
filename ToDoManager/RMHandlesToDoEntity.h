//
//  RMHandlesToDoEntity.h
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoEntity.h"

@protocol RMHandlesToDoEntity <NSObject>

- (void) receiveToDoEntity:(ToDoEntity *) incomingToDoEntity;

@end
