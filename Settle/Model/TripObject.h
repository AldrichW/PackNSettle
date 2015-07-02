//
//  TripObject.h
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-07-01.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface TripObject : NSObject

@property (strong, nonatomic)NSString *tripID;  //This is the internal identifier for each trip and is the unique key when storing on disk.
@property (strong, nonatomic)NSString *title;
@property (strong, nonatomic)Location *location;
@property (strong, nonatomic)NSMutableArray *party;     //An array of objects representing the people in your party

+ (TripObject*)tripWithTitle:(NSString *)title;
+ (TripObject*)tripWithTitle:(NSString*)title location:(Location*)location;
+ (TripObject*)tripWithTitle:(NSString *)title location:(Location *)location party:(NSMutableArray*)party;

@end
