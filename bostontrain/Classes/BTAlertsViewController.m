//
//  BTAlertsViewController.m
//  bostontrain
//
//  Created by Alex Liu on 6/19/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTAlertsViewController.h"

@interface BTAlertsViewController ()

@end

@implementation BTAlertsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationController.wantsFullScreenLayout = NO;
        self.navigationController.navigationBar.translucent = NO;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.layer.borderColor = [[UIColor purpleColor] CGColor];
    self.view.layer.borderWidth = 10;
    
    self.navigationController.navigationBar.layer.borderColor = [[UIColor redColor] CGColor];
    self.navigationController.navigationBar.layer.borderWidth = 5;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
