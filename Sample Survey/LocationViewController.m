//
//  LocationViewController.m
//  betaApp
//
//  Created by Jayanth Devulapally on 6/16/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.location1.layer.borderColor = [UIColor blackColor].CGColor;
    self.location1.layer.borderWidth = 1.0;
    self.location1.layer.cornerRadius = 5.0;
    
    self.location2.layer.borderColor = [UIColor blackColor].CGColor;
    self.location2.layer.borderWidth = 1.0;
    self.location2.layer.cornerRadius = 5.0;
    
    self.location3.layer.borderColor = [UIColor blackColor].CGColor;
    self.location3.layer.borderWidth = 1.0;
    self.location3.layer.cornerRadius = 5.0;
    
    self.cancel.layer.borderColor = [UIColor redColor].CGColor;
    self.cancel.layer.borderWidth = 1.0;
    self.cancel.layer.cornerRadius = 5.0;
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

- (IBAction)location1Select:(id)sender {
    [self status:@"location1"];
}

- (IBAction)location2Select:(id)sender {
    [self status:@"location2"];
}

- (IBAction)location3Select:(id)sender {
    [self status:@"location3"];
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)status:(id)location
{
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"select that applies"
                                message:location
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *visted = [UIAlertAction
                           actionWithTitle:@"I visited this place before" style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {
                               [self navigationToSurveyWithLocation:location andStatus:@"YES"];
                               
                           }];
    UIAlertAction *notVisited = [UIAlertAction
                           actionWithTitle:@"Planning for a visit" style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {
                               [self navigationToSurveyWithLocation:location andStatus:@"NO"];
                           }];
    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:@"Back" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action){}];
    [alert addAction:visted];
    [alert addAction:notVisited];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) navigationToSurveyWithLocation:(NSString *)location andStatus:(NSString *)status {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SurveyViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"survey"];
    [svc passOn:location andStatus:status];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:svc];
    [self presentViewController:navigationController animated:YES completion:nil];
}
@end
