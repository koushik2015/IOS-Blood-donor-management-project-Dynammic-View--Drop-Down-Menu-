//
//  Donor.h
//  BloodManagementSystem
//
//  Created by koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Donor : NSObject
@property NSString* firstName;
@property NSString* lastName;
@property NSString* bloodGroup;
@property NSString* email;
@property NSString* phone;
@property NSString* state;
@property NSString* city;
@property NSString* zip;

-(id)initWithfirstName:(NSString*)firstName andlastname:(NSString*)lastName andbloodgroup:(NSString*)bloodGourp andemail:(NSString*)email andphone:(NSString*)phone andstate:(NSString*)state andcity:(NSString*)city andzip:(NSString*)zip;
@end
