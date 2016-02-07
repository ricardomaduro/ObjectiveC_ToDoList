//
//  MyUINavigationController.h
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMHandlesMOC.h"

@interface MyUINavigationController : UINavigationController <RMHandlesMOC>

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC;

@end
