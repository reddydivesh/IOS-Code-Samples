//
//  ViewController.m
//  betaApp
//
//  Created by Jayanth Devulapally on 6/15/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.start.layer.borderColor = [UIColor blackColor].CGColor;
    self.start.layer.borderWidth = 1.0;
    self.start.layer.cornerRadius = 5.0;
    
    self.profile.layer.borderColor = [UIColor blackColor].CGColor;
    self.profile.layer.borderWidth = 1.0;
    self.profile.layer.cornerRadius = 5.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)startSurveyAction:(id)sender {
    
}

- (IBAction)profileViewAction:(id)sender {
    
}

- (IBAction)legalInfoAction:(id)sender {
}


@end
