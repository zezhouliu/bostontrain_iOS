//
//  BTViewController.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTViewController.h"
#import "BTNavigationController.h"
#import "BTRequest.h"
#import "BTAppDelegate.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BTNavigationItem.h"

@interface BTViewController ()


@end

@implementation BTViewController
@synthesize requestQueue = _requestQueue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Boston T";
        NSLog(@"Reached initialization");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addLeftButton];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (_requestQueue) {
        [self.requestQueue cancelAllOperations];   // XXX
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - request handlers
// lazy loading of request queue
- (NSOperationQueue *) requestQueue
{
    if (!_requestQueue) {
        _requestQueue = [[NSOperationQueue alloc] init];

    }

    return _requestQueue;
}

- (void) setRequestQueue:(NSOperationQueue *) requestQueue
{
    if (_requestQueue != requestQueue)
    {
        _requestQueue = requestQueue;
    }
}

// default selector when succeeds
- (void) requestSucceeded: (BTRequest *) request
{
    NSLog(@"Request successful!");
}

// default selector when fails
- (void) requestFailed: (NSError *) error
{
    [self hideOverlay];

    NSLog(@"Request failed!");
}

# pragma mark - Navigation Bar

// Adds a button on the top left and right of nav bar
- (void) setupNavigationBar
{
    [self addLeftButton];
    [self addRightButton];
}

// Adds left button with selector
- (void) addLeftButton
{
    [self.navigationItem setLeftBarButtonItemWithAction:self action:@selector(leftButtonClicked:)];
}

// Adds right button with selector
- (void) addRightButton
{
    [self.navigationItem setRightBarButtonItemWithAction:self action:@selector(rightButtonClicked:)];
}

// leftButtonClicked defaults to back
- (void) leftButtonClicked: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

// rightButtonClicked defaults to home
- (void) rightButtonClicked: (id) sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

# pragma mark - View Navigation

// shows only view controllers of a particular class
- (void) showViewController: (Class) classOfViewController animated:(BOOL) animated
{
    // get all View Controllers
    NSMutableArray *allViewControllers = [[self.navigationController viewControllers] mutableCopy];

    // go through current ViewControllers and remove all other viewControllers
    for (int frames = [allViewControllers count]; frames > 0; frames--)
    {
        UIViewController *viewController = [allViewControllers objectAtIndex:(frames - 1)];
        if (![viewController isKindOfClass:classOfViewController]) {
            [allViewControllers removeObject:viewController];
        }
    }

    // sets ViewControllers to only those of Class classOfViewController
    // else pops to Home
    if ([allViewControllers count] > 0) {
        [self.navigationController setViewControllers:allViewControllers animated:animated];
    }
    else {
        [self.navigationController popToRootViewControllerAnimated:animated];
    }
}

// pushes a new Viewcontroller onto the navigation controller
- (void) pushViewController: (UIViewController *)newViewController animated:(BOOL)animated
{
    // get all View Controllers
    NSMutableArray *allViewControllers = [[self.navigationController viewControllers] mutableCopy];
    
    // add the newest View Controller
    [allViewControllers addObject:newViewController];
    
    // sets ViewControllers as the new array
    [self.navigationController setViewControllers:allViewControllers animated:animated];
    
}

#pragma mark - Overlay Method
- (void)showOverlay
{
    [self showOverlayWithMessage:@"Loading..."];
}

- (void)showOverlayWithMessage: (NSString *) message
{
    BTAppDelegate *appDelegate = (BTAppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate showOverlayWithMessage:message];
}

- (void)hideOverlay
{
    [self hideOverlay:NO];
}

- (void)hideOverlay:(BOOL)animated
{
    BTAppDelegate *appDelegate = (BTAppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate hideOverlay:animated];
}

@end
