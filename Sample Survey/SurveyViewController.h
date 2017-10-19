//
//  SurveyViewController.h
//  betaApp
//
//  Created by Jayanth Devulapally on 6/18/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"
#import "PageContentViewController.h"

@interface SurveyViewController : UIViewController<UIPageViewControllerDataSource,PageButtonDelegate>

@property (nonatomic,strong) NSString *location;
@property (nonatomic,strong) NSString *status;

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic,strong) PageContentViewController *pcvc;
@property (nonatomic, strong) NSArray *pageTitles;
@property (nonatomic, strong) NSDictionary *statusAvilable;
@property (nonatomic, strong) NSDictionary *questionsAvilable;

@property (nonatomic, strong) NSArray *options;



-(void)passOn:(NSString *)locationSelected andStatus:(NSString *)statusSelected;

@end
