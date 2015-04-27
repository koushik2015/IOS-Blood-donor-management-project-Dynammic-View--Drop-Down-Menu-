//
//  IlluminatiCodersViewController.m
//  BloodManagementSystem
//
//  Created by Koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import "IlluminatiCodersViewController.h"
#import "SearchViewController.h"
#import "RegistrationViewController.h"

@interface IlluminatiCodersViewController ()

@end

@implementation IlluminatiCodersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.donateButton.layer.cornerRadius=8.0;
    self.searchButton.layer.cornerRadius=8.0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"search"]) {
        SearchViewController * searchVC=[segue destinationViewController];
        NSLog(@"%@",searchVC.bloodPicker);
        
    }
    else{
        RegistrationViewController* registrationVC=[segue destinationViewController];
        NSLog(@"%@",registrationVC.bloodGroupTF);
    }
}

@end
