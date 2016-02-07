//
//  MyViewController.h
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMHandlesMOC.h"
#import "RMHandlesToDoEntity.h"


@interface MyViewController : UIViewController <RMHandlesMOC, RMHandlesToDoEntity>

- (void) receiveMOC:(NSManagedObjectContext *)incomingMOC;
- (void) receiveToDoEntity:(ToDoEntity *) incomingToDoEntity;

@end
