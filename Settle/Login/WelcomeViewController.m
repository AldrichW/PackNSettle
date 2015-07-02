//
//  WelcomeViewController.m
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-06-27.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "WelcomeViewController.h"
#import "MainApplicationTableViewController.h"
#import <Venmo-iOS-SDK/Venmo.h>

@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *tryVenmoButton;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if([[Venmo sharedInstance] isSessionValid]){
        //Great, we can go ahead and sign in as this user.
        //Transition to main application interface when user is logged in.
        [self transitionToMainViewController];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tryVenmoButtonPressed:(id)sender {
    if(![Venmo isVenmoAppInstalled]){
        NSLog(@"Looks like venmo hasn't been installed by the user, use the in app venmo API");
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAPI];
    }
    else{
        NSLog(@"Great we have the app installed. Switch the Venmo app");
        [[Venmo sharedInstance] setDefaultTransactionMethod:VENTransactionMethodAppSwitch];
    }
    
    //Request the ability to make payments on user's behalf, access to their profile info, and access to their friends
    [[Venmo sharedInstance] requestPermissions:@[VENPermissionMakePayments, VENPermissionAccessProfile, VENPermissionAccessFriends] withCompletionHandler:^(BOOL success, NSError *error) {
        if(success){
            //Looks like the user has given us access?
            [self transitionToMainViewController];
            
        }
        else if(error){
            NSLog(@"Permission Failure. %@", error);
            
            //Show error message
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Permission Error" message:@"Give us permissions bro" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Got it" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:okAction];
            
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];
    
}

- (void) transitionToMainViewController{
    MainApplicationTableViewController *viewController = [[MainApplicationTableViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:viewController animated:YES];
    });
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
