//
//  PlaceDetailViewController.m
//  ohio_beauty
//
//  Created by Jayanth Devulapally on 12/3/14.
//  Copyright (c) 2014 Jayanth. All rights reserved.
//

#import "PlaceDetailViewController.h"
#import "WebViewController.h"
#import "MasterViewController.h"

@interface PlaceDetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *placeName;
@property (strong, nonatomic) IBOutlet UITextView *placeDescription;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *webButton;
@property (strong, nonatomic) IBOutlet NSString *imgURL;
@end

@implementation PlaceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.placeName.text = self.placeDetails.placeName;
    self.placeDescription.text = self.placeDetails.placeDescription;
    self.imageView.image = [UIImage imageNamed:self.placeDetails.placeImages];
    self.imgURL= self.placeDetails.placeImgURL;
}
- (IBAction)webButtonAction:(id)sender {
    UIStoryboard *mainboard= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WebViewController *webView = (WebViewController *)[mainboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webView.webURL=self.imgURL;
    [self.navigationController pushViewController:webView animated:YES];
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

@end
