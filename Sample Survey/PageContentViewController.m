//
//  PageContentViewController.m
//  betaApp
//
//  Created by Jayanth Devulapally on 6/22/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageLabel.text = self.labelText;
    //setting min value and image
    self.slider.minimumValue = 1;
    //self.slider.minimumValueImage = [UIImage imageNamed:@"min.png"];
    
    //setting max value and image
    self.slider.maximumValue = 4;
    //self.slider.maximumValueImage = [UIImage imageNamed:@"max.png"];
    
    //default
    self.slider.value = 1;
    self.sliderOutputLabel.text = [NSString stringWithFormat:@"Disagree"];
    self.sliderOutputImg.image = [UIImage imageNamed:@"1.png"];
    [self.slider setThumbImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
    
    //arenging the buttons
    if (self.pageIndex == 0) {
        self.prevButton.hidden = YES;
        self.submitSurvey.hidden = YES;
    }
    else if (self.pageIndex == self.maxIndex-1){
        self.submitSurvey.hidden = NO;
        self.nextButton.hidden = YES;
    }
    else{
        self.submitSurvey.hidden = YES;
    }
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

- (IBAction)sliderValue:(id)sender {
    
    int sliderValue;
    sliderValue = round(self.slider.value);
    [self.slider setValue:sliderValue animated:YES];
    
    switch (sliderValue) {
        case 1:
            self.sliderOutputLabel.text = [NSString stringWithFormat:@"Disagree"];
            self.sliderOutputImg.image = [UIImage imageNamed:@"1.png"];
            [self.slider setThumbImage:[UIImage imageNamed:@"min.png"] forState:UIControlStateNormal];
            break;
            
        case 2:
            self.sliderOutputLabel.text = [NSString stringWithFormat:@"Can't say"];
            self.sliderOutputImg.image = [UIImage imageNamed:@"2.png"];
            [self.slider setThumbImage:[UIImage imageNamed:@"min+1.png"] forState:UIControlStateNormal];
            break;
            
        case 3:
            self.sliderOutputLabel.text = [NSString stringWithFormat:@"Partially agree"];
            self.sliderOutputImg.image = [UIImage imageNamed:@"3.png"];
            [self.slider setThumbImage:[UIImage imageNamed:@"max-1.png"] forState:UIControlStateNormal];
            break;
            
        case 4:
            self.sliderOutputLabel.text = [NSString stringWithFormat:@"Agree"];
            self.sliderOutputImg.image = [UIImage imageNamed:@"4.png"];
            [self.slider setThumbImage:[UIImage imageNamed:@"max.png"] forState:UIControlStateNormal];
            break;
        default:
            self.sliderOutputLabel.text = [NSString stringWithFormat:@"Disagree"];
            self.sliderOutputImg.image = [UIImage imageNamed:@"1.png"];
            break;
    }
    
}

- (IBAction)nextPage:(id)sender {
    [self.pageButtonDelegate nextPageNav:self];
}

- (IBAction)prevPage:(id)sender {
    [self.pageButtonDelegate prevPageNav:self];
}

- (IBAction)cancelSurvey:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
