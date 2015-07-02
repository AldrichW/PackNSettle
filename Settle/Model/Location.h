//
//  Location.h
//  Settle
//
//  Created by Aldrich Wingsiong on 2015-07-01.
//  Copyright (c) 2015 ApesInSpace. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject
@property (strong, nonatomic) NSString *cityString;
@property (strong, nonatomic) NSString *stateString;
@property (strong, nonatomic) NSString *countryString;


+ (void)locationWithCity:(NSString*)city state:(NSString *)state country:(NSString*)country;

@end
