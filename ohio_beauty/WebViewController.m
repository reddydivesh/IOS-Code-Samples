//
//  WebViewController.m
//  ohio_beauty
//
//  Created by Jayanth Devulapally on 12/5/14.
//  Copyright (c) 2014 Jayanth. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation WebViewController

- (void)viewDidLoad {
    NSMutableURLRequest * request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.webURL]];
    [self.webView loadRequest:request];
    [super viewDidLoad];
    
    
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
