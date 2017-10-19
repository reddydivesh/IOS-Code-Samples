//
//  ProfileViewController.m
//  betaApp
//
//  Created by Jayanth Devulapally on 6/16/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.saveProfile.layer.borderColor = [UIColor colorWithRed:0.27 green:0.43 blue:0.08 alpha:1.0].CGColor;
    self.saveProfile.layer.borderWidth = 1.0;
    self.saveProfile.layer.cornerRadius = 5.0;
    self.saveProfile.hidden = true;
    
    //testfield
    self.ageText.text = @"14";
    self.ageText.enabled = NO;
    self.genderText.text = @"Male";
    self.genderText.enabled = NO;
    self.gradeText.text = @"9";
    self.gradeText.enabled = NO;
    self.schoolText.text =@"SGHS";
    self.schoolText.enabled = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)profileClose:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)profileEdit:(id)sender {
    //enabling the save button and textfield editing
    self.saveProfile.hidden = false;
    self.ageText.enabled = YES;
    self.genderText.enabled = YES;
    self.gradeText.enabled = YES;
    self.schoolText.enabled = YES;
}

- (IBAction)saveProfile:(id)sender {
    
    //disabling the save buttn and textfield editing
    self.saveProfile.hidden = true;
    self.ageText.text = @"14";
    self.ageText.enabled = NO;
    self.genderText.enabled = NO;
    self.gradeText.enabled = NO;
    self.schoolText.enabled = NO;
}
@end
