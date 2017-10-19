//
//  ProfileViewController.h
//  betaApp
//
//  Created by Jayanth Devulapally on 6/16/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ProfileViewController : UIViewController


- (IBAction)profileClose:(id)sender;
- (IBAction)profileEdit:(id)sender;
- (IBAction)saveProfile:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *ageText;
@property (strong, nonatomic) IBOutlet UITextField *genderText;
@property (strong, nonatomic) IBOutlet UITextField *gradeText;
@property (strong, nonatomic) IBOutlet UITextField *schoolText;
@property (strong, nonatomic) IBOutlet UIButton *saveProfile;

@end
