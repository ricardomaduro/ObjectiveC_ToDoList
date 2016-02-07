//
//  MyUITableTableViewController.m
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import "MyUITableViewController.h"
#import "RMHandlesMOC.h"
#import <CoreData/CoreData.h>
#import "ToDoEntity.h"
#import "MyUITableViewCell.h"
#import "RMHandlesToDoEntity.h"

@interface MyUITableViewController () <UITableViewDataSource,NSFetchedResultsControllerDelegate,UITableViewDelegate>

@property  (strong, nonatomic) NSManagedObjectContext *managedOjectContext;
@property  (strong, nonatomic) NSFetchedResultsController *resultsController;


@end

@implementation MyUITableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeNSFetchedResutsControllerDelegate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultsController.sections[section].numberOfObjects;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ToDoEntity *item = self.resultsController.sections[indexPath.section].objects[indexPath.row];
    
    MyUITableViewCell *cell = (MyUITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableCellIdentifier" forIndexPath:indexPath];
    
    [cell setInternalFields:item];
    
    
    return cell;
}


- (void) controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void) controller:(NSFetchedResultsController *) controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [[self tableView] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            MyUITableViewCell *cell = [[self tableView] cellForRowAtIndexPath:indexPath];
            ToDoEntity *item = [controller objectAtIndexPath:indexPath];
            [cell setInternalFields:item];
            break;
        }
        case NSFetchedResultsChangeMove:
            [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [[self tableView] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];

            break;
    }
    
}

- (void) controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id<RMHandlesMOC, RMHandlesToDoEntity> child = (id<RMHandlesMOC,RMHandlesToDoEntity>)[segue destinationViewController];
    [child receiveMOC:self.managedOjectContext];
    
    ToDoEntity *item;
    if ([sender isMemberOfClass:[UIBarButtonItem class]]) {
        item = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoEntity" inManagedObjectContext:self.managedOjectContext];
    }
    else {
        MyUITableViewCell *source = (MyUITableViewCell *) sender;
        item = source.localToDoEntity;
    }
    
    [child receiveToDoEntity:item];
}


- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC {
    self.managedOjectContext = incomingMOC;

}

#pragma mark - NSFetchedResultsControllerDelegate

- (void) initializeNSFetchedResutsControllerDelegate {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    fetchRequest.entity = [NSEntityDescription entityForName:@"ToDoEntity" inManagedObjectContext:self.managedOjectContext];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"toDoTitle" ascending:YES]];
    
    self.resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedOjectContext sectionNameKeyPath:nil  cacheName:nil];
    
    self.resultsController.delegate = self;
    
    NSError *err;
    BOOL fetchSucceeded = [self.resultsController performFetch:&err];
    
    if (!fetchSucceeded) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Couldn't fetch" userInfo:nil];
    }
}

@end
