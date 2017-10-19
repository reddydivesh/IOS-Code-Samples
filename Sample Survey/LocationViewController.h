//
//  LocationViewController.h
//  betaApp
//
//  Created by Jayanth Devulapally on 6/16/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SurveyViewController.h"

@interface LocationViewController : UIViewController

@property (strong,nonatomic) IBOutlet UIButton *location1;
@property (strong,nonatomic) IBOutlet UIButton *location2;
@property (strong,nonatomic) IBOutlet UIButton *location3;
@property (strong,nonatomic) IBOutlet UIButton *cancel;

- (IBAction)location1Select:(id)sender;
- (IBAction)location2Select:(id)sender;
- (IBAction)location3Select:(id)sender;
- (IBAction)cancel:(id)sender;





@end
