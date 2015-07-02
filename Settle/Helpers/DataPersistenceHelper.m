//
//  DataPersistenceHelper.m
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-07-01.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import "DataPersistenceHelper.h"

@implementation DataPersistenceHelper

+ (void) saveTrip:(TripObject*)trip{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *trips = [userDefaults mutableArrayValueForKey:TRIPS_MUTABLE_ARRAY_KEY];
    
    //Nothing was saved before
    if(!trips){
        trips = [NSMutableArray array];
    }
    [trips addObject:trip];
    
    [userDefaults setObject:trips  forKey:TRIPS_MUTABLE_ARRAY_KEY];
    
    [userDefaults synchronize];
}

+ (NSMutableArray*) loadAllTrips{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *trips = [userDefaults mutableArrayValueForKey:TRIPS_MUTABLE_ARRAY_KEY];
    return trips;
}


@end
