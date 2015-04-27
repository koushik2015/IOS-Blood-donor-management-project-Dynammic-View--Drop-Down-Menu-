//
//  DonorDetailViewController.h
//  BloodManagementSystem
//
//  Created by Koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Donor.h"

@interface DonorDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *firstName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *state;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *zip;
- (IBAction)OK:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *okButton;
@property Donor * donorDetail;
@end
