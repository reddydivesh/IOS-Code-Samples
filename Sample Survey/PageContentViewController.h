//
//  PageContentViewController.h
//  betaApp
//
//  Created by Jayanth Devulapally on 6/22/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PageButtonDelegate <NSObject>

@required
-(void) nextPageNav:(UIViewController *)viewController;
-(void) prevPageNav:(UIViewController *)viewController;

@end

@interface PageContentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *pageLabel;
@property (strong, nonatomic) IBOutlet UILabel *sliderOutputLabel;
@property (strong, nonatomic) IBOutlet UIImageView *sliderOutputImg;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *prevButton;
@property (strong, nonatomic) IBOutlet UIButton *submitSurvey;

@property (weak,nonatomic) id <PageButtonDelegate> pageButtonDelegate;


@property NSString *labelText;
@property NSUInteger pageIndex;

@property NSUInteger maxIndex;

- (IBAction)sliderValue:(id)sender;
- (IBAction)nextPage:(id)sender;
- (IBAction)prevPage:(id)sender;
- (IBAction)cancelSurvey:(id)sender;

@end
