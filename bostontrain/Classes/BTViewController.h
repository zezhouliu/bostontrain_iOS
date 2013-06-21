//
//  BTViewController.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTRequest.h"
#import "BTOverlay.h"
#import "BTNavigationItem.h"
#import "BTNavigationController.h"
#import "BTRequest.h"
#import "BTAppDelegate.h"

@interface BTViewController : UIViewController

// properties
@property (nonatomic, strong) NSOperationQueue *requestQueue;
@property (nonatomic, strong) BTOverlay *overlay;

// request handlers
- (void) setRequestQueue: (NSOperationQueue *) requestQueue;
- (void) requestSucceeded: (BTRequest *) request;
- (void) requestFailed: (NSError *) error;

// Navigation Bar
- (void) setupNavigationBar;
- (void) addLeftButton;
- (void) addRightButton;
- (void) leftButtonClicked: (id) sender;
- (void) rightButtonClicked: (id) sender;

// View Controller Navigation
- (void) showViewController: (Class) classOfViewController animated:(BOOL) animated;
- (void) pushViewController: (UIViewController *) newViewController animated:(BOOL) animated;

// overlay methods
- (void)showOverlay;
@end
