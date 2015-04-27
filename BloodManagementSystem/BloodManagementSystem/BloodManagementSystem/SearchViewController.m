//
//  SearchViewController.m
//  BloodManagementSystem
//
//  Created by Koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import "SearchViewController.h"
#import "Donor.h"
#import "DonorDetailViewController.h"

@interface SearchViewController ()
//Array to store the elements of all blodd groups
@property NSArray* bloodGroupList;

@property NSString* urlString;

// To store all the json fetched data into an mutable array of donor objects.
@property NSMutableArray* donors;

@end

@implementation SearchViewController

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
    //Initianlize the donor objects
    self.donors = [[NSMutableArray alloc] init];
    // allocate the blood groups to bloodGroup List
    self.bloodGroupList=[[NSArray alloc]initWithObjects:@"O+",@"O-",@"A+",@"A-",@"B+",@"B-",@"AB+",@"AB-",nil];
    searchName.text=@"Blood: ";
    searchAreaby.hidden=YES;
    self.bloodPicker.hidden=NO;
    self.rowCount.hidden=YES;
    
    //Reducint the size of picker View
//   self.bloodPicker.frame = CGRectMake(0, 0, 260, 300);
    CGAffineTransform t0 = CGAffineTransformMakeTranslation (0, self.bloodPicker.bounds.size.height);
    CGAffineTransform s0 = CGAffineTransformMakeScale(0.6, 0.5);
    CGAffineTransform t1 = CGAffineTransformMakeTranslation (0, -self.bloodPicker.bounds.size.height/2);
    self.bloodPicker.transform = CGAffineTransformConcat(t0, CGAffineTransformConcat(s0, t1));
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This method tells how many coloms does your picker View Has
#pragma Picker Datasource Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// This method tells how many rows does your picker View has
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.bloodGroupList.count;
}


#pragma  Mark Picket Delegate Methods
// This method returns the title of the blood group which is selected from the picker View
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.bloodGroupList objectAtIndex:row];
}

// This method displays the selected object from the picker View
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"selected : %@", self.bloodGroupList[row]);
    
    
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

- (IBAction)search:(id)sender {
    
    // used to write an error message
    NSError* err;
    [self.view endEditing:YES];
    // An allert View To display the allert message
    UIAlertView * alert;
//    NSString * donorDetail=@"";
    self.rowCount.hidden=NO;
    // As soon as another blood group is selected from the picker view
    // we need to clean out the old blood Group donors from the array to display new donors
    // such that you can avoid appending different blood groups into table view.
    [self.donors removeAllObjects];
    
    if(segmentedContolNumbers.selectedSegmentIndex==0){
    
    //get the selected blodd group from the blood list and store it in an string.
   NSString* selectedBloodGroup=[self.bloodGroupList objectAtIndex:[self.bloodPicker selectedRowInComponent:0]];
        
    
    //Design the URL to make the request of the selected blod group.
   _urlString = [NSString stringWithFormat:@"<Paste your URL here directing to >/searchblood.php?bloodgroup=%@",selectedBloodGroup];
        _urlString = [_urlString stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    }
    
    else{
        _urlString = [NSString stringWithFormat:@":@"<Paste your URL here directing to >/searchblood.php?area=%@",searchAreaby.text];
    }
    //sendign the request.
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]];
    
    //Synchronous request to the URL
    NSData * results = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    
    // Getting the data from the php and storing it in the form of String called "json".
    NSString * json = [[NSString alloc] initWithData:results encoding:NSUTF8StringEncoding];
    
    //Printing out the json data for testing
    NSLog(@"%@",json);
    
    // As 000webhost server is an free webservice, we get data with ads including in it/
    // so to crop ads from out resultant output, i have croped the data and removed ads
    long end = [json rangeOfString:@"]"].location+1;
    
    json = [json substringWithRange:NSMakeRange(0, end)];
    
    // Converting the sring formated data into json and
    // storing the obtained json data into an arrray called "names".
    NSArray * names=[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding]  options:NSJSONReadingMutableContainers error:&err];
    
    // test output to know the array count of names.
//    NSLog(@"%d",names.count);
    
    //if and only if we get any data from the resultant given blood group, we print them to table View.
    if (names.count==0) {
        alert=[[UIAlertView alloc] initWithTitle:@"Donor Not Found" message:@"Sorry, we dont have any donor with this blood Group" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        [self.donorTV reloadData];
        self.navigationItem.title=@"";
        self.rowCount.text=@"Non !!";
        self.donorDetail.text=@"No records of Donors";
    }
    else{
    
        //Stroring the names array to dictionary type
    for (NSDictionary * dict in names) {
        //testing the dictionary using the last name of the donor
        
        [self.donors addObject:[[Donor alloc] initWithfirstName:dict[@"FirstName"] andlastname:dict[@"LastName"] andbloodgroup:dict[@"BloodGroup"] andemail:dict[@"Email"] andphone:dict[@"Phone"] andstate:dict[@"State"] andcity:dict[@"city"] andzip:dict[@"zip"]]];
    }
        
    // In order to load the data into table View cell
    [self.donorTV reloadData];
        
    //Setting the Navigation title to the selected Blood Goroup
    self.navigationItem.title=[self.donors[0] bloodGroup];
        self.rowCount.text=[NSString stringWithFormat:@"%lu",(unsigned long)self.donors.count];
    }

}

- (IBAction)changeSearch:(id)sender {
    if (segmentedContolNumbers.selectedSegmentIndex==0) {
        searchName.text=@"Blood: ";
        searchAreaby.hidden=YES;
        self.bloodPicker.hidden=NO;
        searchName.hidden=NO;
    }
    else{
        searchName.hidden=YES;
        searchAreaby.hidden=NO;
        self.bloodPicker.hidden=YES;
    
    }

    
}

- (IBAction)backHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// This method returns the number of rows in your table view controller
#pragma Table View Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.donors.count;
}

// Defining contant to the view with their tag numbers
#define FIRSTNAME 100
#define LASTNAME 101
#define CITY 102

//setting up the values to the table view cell ("Rows") using its identifiers.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Donor * donorTableView=self.donors[indexPath.row];
    
    UILabel* name=(UILabel *)[cell viewWithTag:100];
    UILabel* address=(UILabel *)[cell viewWithTag:101];
    UILabel* detail=(UILabel *)[cell viewWithTag:102];
    
    
    name.text=[NSString stringWithFormat:@"%@  %@",donorTableView.firstName,donorTableView.lastName];
    address.text=[NSString stringWithFormat:@"%@ %@ %@",donorTableView.city,donorTableView.state,donorTableView.zip];
    if(segmentedContolNumbers.selectedSegmentIndex==0){
    detail.text=@"Tap to View";
        
        // displaying the the donor detail with blood group
        NSLog(@"%@",donorTableView.bloodGroup);
        if ([donorTableView.bloodGroup isEqualToString:@"O"] || [donorTableView.bloodGroup isEqualToString:@"A"]||[donorTableView.bloodGroup isEqualToString:@"AB"]||[donorTableView.bloodGroup isEqualToString:@"B"]) {
            self.donorDetail.text=[NSString stringWithFormat:@"Donors with %@+ Group",donorTableView.bloodGroup];
        }
        else
            self.donorDetail.text=[NSString stringWithFormat:@"Donors with %@ Group",donorTableView.bloodGroup];
    
    }
    else{
        self.donorDetail.text=[NSString stringWithFormat:@"Donors from %@ ",searchAreaby.text];
        if ([donorTableView.bloodGroup isEqualToString:@"O"]) {
            detail.text=@"O+";
        }
    else
        detail.text=donorTableView.bloodGroup;
    }
    
//    NSLog(@"hahaaahahahhahaha %@",firstName.text);
    return cell;
    
}

// Navigating the view by clicking on the perticular row.
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DonorDetailViewController* donorDVC=[segue destinationViewController];
    NSIndexPath* donorIndexPath=[self.donorTV indexPathForSelectedRow];
    donorDVC.donorDetail=self.donors[donorIndexPath.row];
    
}



@end
