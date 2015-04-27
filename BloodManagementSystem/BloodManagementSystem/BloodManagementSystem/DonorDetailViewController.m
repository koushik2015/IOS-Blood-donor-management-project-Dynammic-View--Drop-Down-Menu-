//
//  DonorDetailViewController.m
//  BloodManagementSystem
//
//  Created by Koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import "DonorDetailViewController.h"

@interface DonorDetailViewController ()

@end

@implementation DonorDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated{
    self.firstName.text=self.donorDetail.firstName;
    self.lastName.text=self.donorDetail.lastName;
    self.email.text=self.donorDetail.email;
    self.phone.text=self.donorDetail.phone;
    self.state.text=self.donorDetail.state;
    self.city.text=self.donorDetail.city;
    self.zip.text=self.donorDetail.zip;
    self.navigationItem.title=self.donorDetail.firstName;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.okButton.layer.cornerRadius=8.0;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)OK:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
