//
//  NewTripFormViewController.m
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-07-01.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "NewTripFormViewController.h"
#import "TripObject.h"
#import "Location.h"
#import "DataPersistenceHelper.h"

@interface NewTripFormViewController ()
@property (weak, nonatomic) IBOutlet UILabel *addTripTitle;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UITextField *partyTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (strong, nonatomic) TripObject *tripObject;

@end

@implementation NewTripFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButtonPressed:(id)sender {
    if([_titleTextField.text isEqualToString:@""]){
        //You must have at least a title
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Incomplete Information" message:@"A title is required for your new trip" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleCancel handler:nil];
            
            [alertController addAction:okButton];
            
            [self presentViewController:alertController animated:YES completion:nil];
        });
    }
    
    Location *location = nil;
    NSMutableArray *partyArray = [NSMutableArray array];
    
    //Create and save your new trip.
    _tripObject = [TripObject tripWithTitle:_titleTextField.text location:location party:partyArray];
    [DataPersistenceHelper saveTrip:_tripObject];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
