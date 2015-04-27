//
//  RegistrationViewController.m
//  BloodManagementSystem
//
//  Created by Koushik on 11/11/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

//Array to store the elements of all blodd groups
@property NSArray* bloodGroupList;
@end

@implementation RegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
     self.bloodGroupList=[[NSArray alloc]initWithObjects:@"O+",@"O-",@"A+",@"A-",@"B+",@"B-",@"AB+",@"AB-",nil];
    
    _dropDownTableView=[[UITableView alloc]init];
    _dropDownTableView.dataSource=self;
    _dropDownTableView.delegate=self;
    _dropDownTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _dropDownTableView.backgroundColor = [UIColor lightGrayColor];
    [_dropDownTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [_dropDownTableView reloadData];
    [self.view addSubview:_dropDownTableView];
    _dropDownTableView.hidden = YES;
    
    //Making Button rounded
    self.cancelButton.layer.cornerRadius=8.0;
    self.registerButton.layer.cornerRadius=8.0;
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"drop.png"]];
    backgroundView.alpha=0.5;
    backgroundView.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:backgroundView];
    [self.view sendSubviewToBack:backgroundView];
    
    //Placing a place holder with down arraow
    self.bloodGroupTF.placeholder=@"Select Blood From Drop Down        \u2B07\uFE0E";
    
    //sliding up keyboard
    
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return [_bloodGroupList count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier  forIndexPath:indexPath] ;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
            cell.textLabel.text=[_bloodGroupList objectAtIndex:indexPath.row];
    
    cell.textLabel.font  = [UIFont fontWithName:@"Gill Sans" size:12.0];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        _bloodGroupTF.text = [_bloodGroupList objectAtIndex:indexPath.row];
    self.dropDownTableView.hidden=YES;
    
}



- (IBAction)send:(id)sender {
    
    NSError* err;
    UIAlertView * alert;
    
//    //Checking the blood group entered
//    BOOL bloodTFOK=NO;
//    for (int i=0; i<self.bloodGroupList.count; i++) {
//        if ([self.bloodGroupTF.text isEqualToString:self.bloodGroupList[i]]) {
//            bloodTFOK=YES;
//        }
//    }

    
    if ([self.fnameTF.text isEqualToString:@""]||[self.lnameTF.text isEqualToString:@""]||[self.bloodGroupTF.text isEqualToString:@""]||[self.emailTF.text isEqualToString:@""]||[self.phoneTF.text isEqualToString:@""]||[self.stateTF.text isEqualToString:@""]||[self.cityTF.text isEqualToString:@""]||[self.zipTF.text isEqualToString:@""]) {
                alert=[[UIAlertView alloc] initWithTitle:@"Fields are Empty" message:@"All Fields are Mandatory" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
    else if (![self NSStringIsValidEmail:self.emailTF.text]){
//        alert=[[UIAlertView alloc] initWithTitle:@"Invalid Email Address" message:@"Please check your email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
        self.emailErrorMsg.text=@"Invalid Email Address";
    }
    

    
    else if (!(self.phoneTF.text.length==10)){
//        alert=[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Phone Number should be Numaric" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
        self.mobileErrorMsg.text=@"Mobile number Should be of 10 Digits.";
        self.emailErrorMsg.hidden=YES;
    }
    else if ([self.zipTF.text intValue]==0)
    {
//        alert=[[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Zip Code should be Numaric" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
        self.postalErrorMsg.text=@"Invalid Zip Postal";
        self.mobileErrorMsg.hidden=YES;
    }
    else{
    NSString *noteDataString = [NSString stringWithFormat:@"<Paste your URL here directing to the registration page>?firstname=%@&lastname=%@&bloodgroup=%@&email=%@&phone=%@&state=%@&city=%@&zip=%@",self.fnameTF.text,self.lnameTF.text,self.bloodGroupTF.text,self.emailTF.text,self.phoneTF.text,self.stateTF.text,self.cityTF.text,self.zipTF.text];
        noteDataString = [noteDataString stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:noteDataString]];
    
    NSData * results = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
        alert=[[UIAlertView alloc] initWithTitle:@"Registration Success" message:@"Thank You. You are a Hero" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"%@",results);
        self.postalErrorMsg.hidden=YES;
    
    }
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.stateTF.textInputView || self.cityTF.textInputView || self.zipTF.textInputView) {
        
    
    [self animateTextField: textField up: YES];
        
    }
    
}





- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
        [self animateTextField: textField up: NO];
        
    }
- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
}




-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (IBAction)dropDownTableButton:(id)sender {
    _dropDownTableView.frame = CGRectMake(16, 166, 262, 100);
    [_dropDownTableView reloadData];
    _dropDownTableView.hidden = NO;
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.bloodGroupTF resignFirstResponder];
    _dropDownTableView.hidden = YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)cancleRegistration:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
