//
//  RMHandlesMOC.h
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RMHandlesMOC <NSObject>

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC;

@end
