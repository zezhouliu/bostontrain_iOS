//
//  BTNextArrivalViewController.h
//  bostontrain
//
//  Created by Alex Liu on 7/9/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTViewController.h"

@interface BTNextArrivalViewController : BTViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *arrivalTableView;

@end
