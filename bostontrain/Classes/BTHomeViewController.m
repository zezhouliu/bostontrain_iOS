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
#import "FlatUIKit.h"

@interface BTHomeViewController ()

@property (nonatomic, strong) BTView *alertHeader;

@end

@implementation BTHomeViewController

/* * * * * * * * * *
 * Initialization: Try NOT to use nib files
 * params: none
 * returns: BTHomeViewController
 * * * * * * * * * */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Boston T-line";
    }
    return self;
}

/* * * * * * * * * *
 * viewDidLoad: As our view loads, we need to setup several components
 * Components: NavigationBar, SearchBar, OptionButtons
 * * * * * * * * * */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self setupNavigationBar];
    [self setupRoutePlanner];
    [self setupSearchBar];
    [self setupOptionButtons];
//    [self addAlertSection];
    
}


# pragma mark - page loading
/* * * * * * * * *
 * setupRoutePlanner sets up 2 textfields to query trip planner
 * params: none
 * returns void
 * * * * * * * * */
- (void) setupRoutePlanner
{
    self.routePlannerBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    self.fromField.frame = CGRectMake(0, 0, self.view.frame.size.width / 2, 50);
    self.toField.frame = CGRectMake(self.fromField.frame.origin.x + self.fromField.frame.size.width,
                                    self.fromField.frame.origin.y, self.fromField.frame.size.width, self.fromField.frame.size.height);
}



/* * * * * * * * *
 * setupSearchBar sets up the search bar
 * params: none
 * returns void
 * * * * * * * * */
- (void) setupSearchBar
{
    
}



/* * * * * * * * *
 * setupOptionButtons generates our buttons that allows users
 *     to choose which train line they want information about
 *     Currently supports: red, blue, orange, green
 * params: none
 * returns void
 * * * * * * * * */
- (void) setupOptionButtons
{
    
    // redLine button on top left
    self.redLineButton.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height + 20, self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 50);
    [self.redLineButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.redLineButton];
    
    // blue line button on top right
    self.blueLineButton.frame = CGRectMake(self.redLineButton.frame.origin.x + self.redLineButton.frame.size.width,
                                    self.redLineButton.frame.origin.y, self.view.frame.size.width - self.redLineButton.frame.size.width,
                                    self.redLineButton.frame.size.height);
    [self.blueLineButton addTarget:self action:@selector(blueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.blueLineButton];
    
    // orange line button on the bottom left
    self.orangeLineButton.frame = CGRectMake(self.redLineButton.frame.origin.x, self.redLineButton.frame.origin.y + self.redLineButton.frame.size.height,
                                       self.redLineButton.frame.size.width, self.redLineButton.frame.size.height);
    [self.orangeLineButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.orangeLineButton];
    
    // green line button on the bottom right
    self.greenLineButton.frame = CGRectMake(self.orangeLineButton.frame.origin.x + self.orangeLineButton.frame.size.width, self.orangeLineButton.frame.origin.y,
                                      self.blueLineButton.frame.size.width, self.orangeLineButton.frame.size.height);   
    [self.greenLineButton addTarget:self action:@selector(greenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.greenLineButton];
    
}

- (void) redButtonClicked
{
    
}

- (void) blueButtonClicked
{
    
}

- (void) greenButtonClicked
{
    
}

- (void) orangeButtonClicked
{
    
}
# pragma mark - subviews
/* * * * * * *
 * In this section, we lazy load our subviews
 * by only allocating memory for them if they do not already exist
 * * * * * * */


- (FUIButton *) redLineButton
{
    if (!_redLineButton) {
        _redLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _redLineButton.buttonColor = [UIColor alizarinColor];
        _redLineButton.shadowColor = [UIColor pomegranateColor];
        _redLineButton.shadowHeight = 3.0f;
        _redLineButton.cornerRadius = 6.0f;
        _redLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_redLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_redLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        
    }
    
    return _redLineButton;
}

- (FUIButton *) blueLineButton
{
    if (!_blueLineButton) {
        _blueLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _blueLineButton.buttonColor = [UIColor peterRiverColor];
        _blueLineButton.shadowColor = [UIColor belizeHoleColor];
        _blueLineButton.shadowHeight = 3.0f;
        _blueLineButton.cornerRadius = 6.0f;
        _blueLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_blueLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_blueLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
    
    return _blueLineButton;
}

- (FUIButton *) greenLineButton
{
    if (!_greenLineButton) {
        _greenLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _greenLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _greenLineButton.buttonColor = [UIColor emerlandColor];
        _greenLineButton.shadowColor = [UIColor nephritisColor];
        _greenLineButton.shadowHeight = 3.0f;
        _greenLineButton.cornerRadius = 6.0f;
        _greenLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_greenLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_greenLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
    
    return _greenLineButton;
}

- (FUIButton *) orangeLineButton
{
    if (!_orangeLineButton) {
        _orangeLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _orangeLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _orangeLineButton.buttonColor = [UIColor carrotColor];
        _orangeLineButton.shadowColor = [UIColor pumpkinColor];
        _orangeLineButton.shadowHeight = 3.0f;
        _orangeLineButton.cornerRadius = 6.0f;
        _orangeLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_orangeLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_orangeLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
    
    return _orangeLineButton;
}
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
