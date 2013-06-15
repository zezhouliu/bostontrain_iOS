//
//  BTMasterViewController.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BTDetailViewController;

@interface BTMasterViewController : UITableViewController

@property (strong, nonatomic) BTDetailViewController *detailViewController;

@end
