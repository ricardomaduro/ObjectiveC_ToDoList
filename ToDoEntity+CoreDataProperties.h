//
//  ToDoEntity+CoreDataProperties.h
//  ToDoManager
//
//  Created by Ricardo Maduro on 31/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *toDoCity;
@property (nullable, nonatomic, retain) NSString *toDoCountry;
@property (nullable, nonatomic, retain) NSString *toDoTitle;

@end

NS_ASSUME_NONNULL_END
