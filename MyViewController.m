//
//  MyViewController.m
//  ToDoManager
//
//  Created by Ricardo Maduro on 27/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@property  (strong, nonatomic) NSManagedObjectContext *managedOjectContext;
@property  (strong, nonatomic) ToDoEntity  *localToDoEntity;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *detailsField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;

@property (nonatomic, assign) BOOL wasDeleted;


@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) saveMyToDoEntity {
    
    NSError *err;
    BOOL saveSuccess  = [self.managedOjectContext save:&err];
    
    if (!saveSuccess) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:@{NSUnderlyingErrorKey:err}];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) textViewDidEndEditing: (NSNotification *) notification {
    if ([notification object] == self) {
        self.localToDoEntity.toDoCity = self.detailsField.text;
        //[self saveMyToDoEntity];
    }
}

- (void) viewWillDisappear:(BOOL)animated {
    if (self.wasDeleted == NO) {
        self.localToDoEntity.toDoTitle = self.titleField.text;
        self.localToDoEntity.toDoCity = self.detailsField.text;
        self.localToDoEntity.toDoCountry = self.countryField.text;

        //[self saveMyToDoEntity];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidEndEditingNotification object:self];
}

- (void) viewWillAppear:(BOOL)animated {
    self.wasDeleted = NO;
    self.titleField.text = self.localToDoEntity.toDoTitle;
    self.detailsField.text = self.localToDoEntity.toDoCity;
    self.countryField.text = self.localToDoEntity.toDoCountry;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector
    (textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
    
}

- (IBAction)trashTapped:(id)sender {
    self.wasDeleted = YES;
    [self.managedOjectContext deleteObject:self.localToDoEntity];
    //[self saveMyToDoEntity];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)titleFieldEdited:(id)sender {
    self.localToDoEntity.toDoTitle = self.titleField.text;
    
    //[self saveMyToDoEntity];
}

- (IBAction)dueDateEditing:(id)sender {
    //self.localToDoEntity.toDoDueDate = self.dateField.date;
    self.localToDoEntity.toDoCountry = self.countryField.text;

    //[self saveMyToDoEntity];

}
- (IBAction)dueDateEdittingDidEnd:(id)sender {
    //self.localToDoEntity.toDoDueDate = self.dateField.date;
    self.localToDoEntity.toDoCountry = self.countryField.text;

    //[self saveMyToDoEntity];
}
- (IBAction)dueDateValueChanged:(id)sender {
    //self.localToDoEntity.toDoDueDate = self.dateField.date;
    self.localToDoEntity.toDoCountry = self.countryField.text;

    //[self saveMyToDoEntity];
}

- (void) receiveMOC:(NSManagedObjectContext *) incomingMOC {
    self.managedOjectContext = incomingMOC;
}

- (void) receiveToDoEntity:(ToDoEntity *) incomingToDoEntity {
    self.localToDoEntity = incomingToDoEntity;
}


@end
