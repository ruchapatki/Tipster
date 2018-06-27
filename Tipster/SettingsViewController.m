//
//  SettingsViewController.m
//  Tipster
//
//  Created by Rucha Patki on 6/26/18.
//  Copyright © 2018 Rucha Patki. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipDefault;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    self.tipDefault.selectedSegmentIndex = doubleValue;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tipDefaultChange:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double newDefault = self.tipDefault.selectedSegmentIndex;
    [defaults setDouble:newDefault forKey:@"default_tip_percentage"];
    [defaults synchronize];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
