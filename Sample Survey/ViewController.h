//
//  ViewController.h
//  betaApp
//
//  Created by Jayanth Devulapally on 6/15/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *start;
@property (strong, nonatomic) IBOutlet UIButton *profile;
@property (strong,nonatomic) IBOutlet UILabel *info;


- (IBAction)startSurveyAction:(id)sender;

- (IBAction)profileViewAction:(id)sender;

- (IBAction)legalInfoAction:(id)sender;

@end

