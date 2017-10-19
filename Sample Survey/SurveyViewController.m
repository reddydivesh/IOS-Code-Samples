//
//  SurveyViewController.m
//  betaApp
//
//  Created by Jayanth Devulapally on 6/18/15.
//  Copyright (c) 2015 psyc. All rights reserved.
//

#import "SurveyViewController.h"
#import "PageContentViewController.h"

@interface SurveyViewController () <PageButtonDelegate>

@end

@implementation SurveyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSLog(@"%@  %@", self.location, self.status);
    self.navigationController.navigationBarHidden = YES;
    //acessting questions
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
    NSDictionary *locationDictonary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.statusAvilable = locationDictonary[self.location];
    self.questionsAvilable = self.statusAvilable[self.status];
    self.pageTitles = self.questionsAvilable.allKeys;
    
    
    //data modal for page view
    //self.pageTitles =  @[@"question 1", @"question 2", @"question 3", @"question 4", @"question 5"];
    
    //creating page view controler
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    //disabling swipe gesture
    for (UIScrollView *view in self.pageViewController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            view.scrollEnabled = NO;
        }
    }
    [self viewControllerAtIndex:0];
    [self reloadInputViews];
}

-(void)passOn:(NSString *)locationSelected andStatus:(NSString *)statusSelected{
    self.location = locationSelected;
    self.status = statusSelected;
}
//
//-(void) selectedLocation:(NSString *)location andStatus:(NSString *)status fromDic:(NSDictionary*)plistData{
//    
//    self.locationAvilable = plistData[location];
//}
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

-(void)viewControllerAtIndex:(NSUInteger)index
{
    if ( ([self.pageTitles count] == 0) || (index >= [self.pageTitles count]) ) {
        //return 0;
    }
    //creating new view controller and pass the data
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentController"];
    pageContentViewController.pageButtonDelegate = self;
    pageContentViewController.labelText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    pageContentViewController.maxIndex = [self.pageTitles count];
    NSArray *viewController = @[pageContentViewController];
    [self.pageViewController setViewControllers:viewController direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}

#pragma pagebutton delegate

-(void) nextPageNav:(UIViewController *) viewController{
    
    NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
    if (index++ < [self.pageTitles count]-1) {
         [self viewControllerAtIndex:index++];
    }
}

-(void) prevPageNav:(UIViewController *) viewController{
    NSUInteger index = ((PageContentViewController *) viewController).pageIndex;
    if (index-- > 0) {
        [self viewControllerAtIndex:index--];
    }
}

#pragma pageview data source
-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
   return nil;
}

-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    return nil;
}

-(NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

-(NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
