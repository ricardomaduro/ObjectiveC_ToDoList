//
//  MyUINavigationController.m
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import "MyUINavigationController.h"

@interface MyUINavigationController ()
@property  (strong, nonatomic) NSManagedObjectContext *managedOjectContext;

@end

@implementation MyUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC {
    self.managedOjectContext = incomingMOC;
    id<RMHandlesMOC> child = (id<RMHandlesMOC>) self.viewControllers[0];
    [child receiveMOC:self.managedOjectContext];
}

@end
