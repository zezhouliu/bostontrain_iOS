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
    [self setupOptionButtons];
//    [self addAlertSection];
    
}


# pragma mark - subviews
- (void) setupOptionButtons
{
    
    // redLine button on top left
    self.redLineButton.frame = CGRectMake(0, 0, self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 50);
    [self.redLineButton setBackgroundImage:[[UIImage imageNamed:@"red_button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 5, 30, 5)] forState:UIControlStateNormal];
    [self.redLineButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.redLineButton];
    
    // blue line button on top right
    self.blueLineButton.frame = CGRectMake(self.redLineButton.frame.origin.x + self.redLineButton.frame.size.width,
                                    self.redLineButton.frame.origin.y, self.view.frame.size.width - self.redLineButton.frame.size.width,
                                    self.redLineButton.frame.size.height);
    [self.blueLineButton setBackgroundImage:[[UIImage imageNamed:@"blue_button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 5, 30, 5)] forState:UIControlStateNormal];
    [self.blueLineButton addTarget:self action:@selector(blueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.blueLineButton];
    
    // orange line button on the bottom left
    self.orangeLineButton.frame = CGRectMake(self.redLineButton.frame.origin.x, self.redLineButton.frame.origin.y + self.redLineButton.frame.size.height,
                                       self.redLineButton.frame.size.width, self.redLineButton.frame.size.height);
    [self.orangeLineButton setBackgroundImage:[[UIImage imageNamed:@"orange_button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 5, 30, 5)] forState:UIControlStateNormal];
    [self.orangeLineButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.orangeLineButton];
    
    // green line button on the bottom right
    self.greenLineButton.frame = CGRectMake(self.orangeLineButton.frame.origin.x + self.orangeLineButton.frame.size.width, self.orangeLineButton.frame.origin.y,
                                      self.blueLineButton.frame.size.width, self.orangeLineButton.frame.size.height);
    [self.greenLineButton setBackgroundImage:[[UIImage imageNamed:@"green_button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(30, 5, 30, 5)] forState:UIControlStateNormal];
    [self.greenLineButton addTarget:self action:@selector(greenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.greenLineButton];
    
}

// Lazy load the views by allocating for them only when they do not already exist
- (UIButton *) redLineButton
{
    if (!_redLineButton) {
        _redLineButton = [[UIButton alloc] initWithFrame:CGRectZero];
        
    }
    
    return _redLineButton;
}

- (UIButton *) blueLineButton
{
    if (!_blueLineButton) {
        _blueLineButton = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    
    return _blueLineButton;
}

- (UIButton *) greenLineButton
{
    if (!_greenLineButton) {
        _greenLineButton = [[UIButton alloc] initWithFrame:CGRectZero];
    }
    
    return _greenLineButton;
}

- (UIButton *) orangeLineButton
{
    if (!_orangeLineButton) {
        _orangeLineButton = [[UIButton alloc] initWithFrame:CGRectZero];
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
