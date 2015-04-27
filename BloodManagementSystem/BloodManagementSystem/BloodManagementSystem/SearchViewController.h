//
//  SearchViewController.h
//  BloodManagementSystem
//
//  Created by Koushik on 11/10/14.
//  Copyright (c) 2014 Koushik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    __weak IBOutlet UISegmentedControl *segmentedContolNumbers;
    
    __weak IBOutlet UITextField *searchAreaby;
    __weak IBOutlet UILabel *searchName;
}
@property (weak, nonatomic) IBOutlet UIPickerView *bloodPicker;
@property (weak, nonatomic) IBOutlet UITableView *donorTV;
- (IBAction)search:(id)sender;
- (IBAction)changeSearch:(id)sender;
- (IBAction)backHome:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *rowCount;
@property (weak, nonatomic) IBOutlet UILabel *donorDetail;

@end
