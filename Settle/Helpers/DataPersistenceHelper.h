//
//  DataPersistenceHelper.h
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-07-01.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TripObject.h"
#import "SettleConstants.h"

@interface DataPersistenceHelper : NSObject

+ (void) saveTrip:(TripObject*)trip;
+ (NSMutableArray*) loadAllTrips;

@end
