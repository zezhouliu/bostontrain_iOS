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

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.backgroundColor = [[UIColor purpleColor] CGColor];
	// Do any additional setup after loading the view.
    
    [self getAlerts];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - requests

- (void) getAlerts
{
    BTRequest *request = [BTRequest getAlertsWithDelegate:self succeedSelector:@selector(getAlertsRequestDidSucceed:)];
    [self.requestQueue addOperation:request];
}

- (void) getAlertsRequestDidSucceed: (BTRequest *) request
{
    // render alerts in table view
}

@end
