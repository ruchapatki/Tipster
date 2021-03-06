//
//  ViewController.m
//  Tipster
//
//  Created by Rucha Patki on 6/26/18.
//  Copyright © 2018 Rucha Patki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourLabel;



@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *bills = [NSUserDefaults standardUserDefaults];
    NSString *billValue = [bills stringForKey:@"default_billValue"];
    self.mealBillField.text = billValue;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    self.tipControl.selectedSegmentIndex = doubleValue;
    [self onEdit:self];
    
    [self.mealBillField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    //f indicates double, .2 indicates 2 decimal places
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
    self.twoLabel.text = [NSString stringWithFormat:@"$%.2f", total/2];
    self.threeLabel.text = [NSString stringWithFormat:@"$%.2f", total/3];
    self.fourLabel.text = [NSString stringWithFormat:@"$%.2f", total/4];
    
    
    NSUserDefaults *bills = [NSUserDefaults standardUserDefaults];
    NSString *newBill = self.mealBillField.text;
    [bills setObject:newBill forKey:@"default_billValue"];
    [bills synchronize];
}

- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
    self.mealBillField.frame = CGRectMake(self.mealBillField.frame.origin.x, self.mealBillField.frame.origin.y + 30, self.mealBillField.frame.size.width, self.mealBillField.frame.size.height);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 0;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -= 30;
    
    //2nd parameter is block code, everything inside the block is animation
    [UIView animateWithDuration:0.2 animations:^{
        self.mealBillField.frame = newFrame;
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
}


@end
