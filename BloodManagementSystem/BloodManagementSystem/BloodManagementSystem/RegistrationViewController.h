//
//  RegistrationViewController.h
//  BloodManagementSystem
//
//  Created by Koushik on 11/11/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fnameTF;
@property UITableView *dropDownTableView;
@property (weak, nonatomic) IBOutlet UITextField *lnameTF;
- (IBAction)cancleRegistration:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *stateTF;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (weak, nonatomic) IBOutlet UITextField *cityTF;
@property (weak, nonatomic) IBOutlet UITextField *zipTF;
- (IBAction)send:(id)sender;
- (IBAction)dropDownTableButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *bloodGroupTF;
@property (weak, nonatomic) IBOutlet UILabel *bloodErrorMsg;
@property (weak, nonatomic) IBOutlet UILabel *emailErrorMsg;
@property (weak, nonatomic) IBOutlet UILabel *mobileErrorMsg;
@property (weak, nonatomic) IBOutlet UILabel *postalErrorMsg;


@end
