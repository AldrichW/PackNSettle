//
//  AppDelegate.h
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-06-27.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Venmo-iOS-SDK/Venmo.h>
#import "WelcomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UINavigationController *mainNavigationController;
@property (strong, nonatomic) WelcomeViewController *rootViewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

