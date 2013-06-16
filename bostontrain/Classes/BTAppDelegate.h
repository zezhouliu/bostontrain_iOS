//
//  BTAppDelegate.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTOverlay.h"


@interface BTAppDelegate : UIResponder <UIApplicationDelegate>

// properties
@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) BTOverlay *overlay;

// visible methods
- (void)showOverlayWithMessage:(NSString *) message;
- (void)hideOverlay:(BOOL)animated;


@end
