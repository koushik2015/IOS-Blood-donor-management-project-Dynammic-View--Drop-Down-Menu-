//
//  Donor.m
//  BloodManagementSystem
//
//  Created by Thangallapalli,Koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import "Donor.h"

@implementation Donor
-(id)initWithfirstName:(NSString*)firstName andlastname:(NSString*)lastName andbloodgroup:(NSString*)bloodGourp andemail:(NSString*)email andphone:(NSString*)phone andstate:(NSString*)state andcity:(NSString*)city andzip:(NSString*)zip{
    self=[super init];
    if (self) {
        _firstName=firstName;
        _lastName=lastName;
        _bloodGroup=bloodGourp;
        _email=email;
        _phone=phone;
        _state=state;
        _city=city;
        _zip=zip;
    }
    return self;
}

@end
