//
//  UserTableViewTableViewController.h
//  Money_Tracker
//
//  Created by Jayanth Devulapally on 4/25/15.
//  Copyright (c) 2015 KM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserEntryVC.h"

@interface UserTableViewTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *details;
@property (strong, nonatomic) NSDictionary *savedData;


@end
