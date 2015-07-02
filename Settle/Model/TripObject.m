//
//  TripObject.m
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-07-01.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "TripObject.h"

@implementation TripObject

+ (TripObject*)tripWithTitle:(NSString *)title{
    return [TripObject tripWithTitle:title location:nil party:nil];
}

+ (TripObject*)tripWithTitle:(NSString*)title location:(Location*)location{
    return [TripObject tripWithTitle:title location:location party:nil];
}

+ (TripObject*)tripWithTitle:(NSString *)title location:(Location *)location party:(NSMutableArray*)party{
    
    TripObject *tripObject = [[TripObject alloc] init];
    
    //Hmm is this actually disk safe doe?
    //Get file system safe title to have as id of trip object
    NSString *diskSafeTitle = [title stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    [tripObject setTripID:diskSafeTitle];
    [tripObject setTitle:title];
    [tripObject setLocation:location];
    [tripObject setParty:party];
    
    return tripObject;
}

@end
