//
//  BTHomeViewController.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTHomeViewController.h"
#import "BTAlertsViewController.h"
#import <UIKit/UIKit.h>

@interface BTHomeViewController ()

@property (nonatomic, strong) BTView *alertHeader;

@end

@implementation BTHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Boston T-line";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setupNavigationBar];
    [self addAlertSection];
    
}


# pragma mark - subviews
- (void) addAlertSection
{
    self.alertHeader = [[BTView alloc] initWithFrame:CGRectMake(-5, 0, self.view.frame.size.width + 15, 35)];

    UIImageView *alertViewImg = [[UIImageView alloc] initWithFrame:self.alertHeader.frame];
    alertViewImg.backgroundColor = [UIColor greenColor];
    alertViewImg.image = [UIImage imageNamed:@"red_button.png"];
    [self.alertHeader addSubview:alertViewImg];
    
    UILabel *alertViewHeaderText = [[UILabel alloc] initWithFrame:self.alertHeader.frame];
    alertViewHeaderText.backgroundColor = [UIColor clearColor];
    alertViewHeaderText.textAlignment = NSTextAlignmentCenter;
    alertViewHeaderText.text = @"Recent MBTA alerts";
    [self.alertHeader addSubview:alertViewHeaderText];
    
    [self.view addSubview:self.alertHeader];
    
}
# pragma mark - navigation buttons
- (void) setupNavigationBar
{
    [self addRightButton];
}

- (void) addRightButton
{
    
    [self.navigationItem setRightBarButtonItemWithActionAndTitle:self title:@"" action:@selector(rightButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem.style = UIBarButtonSystemItemDone;
    self.navigationItem.rightBarButtonItem.title = @"Alex";
}

- (void) rightButtonClicked: (id) sender
{
    BTAlertsViewController *alertViewController = [[BTAlertsViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:alertViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
