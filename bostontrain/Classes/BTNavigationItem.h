//
//  BTNavigationItem.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (BT)


// visible methods

- (void) setRightBarButtonItemWithActionAndTitle:(id) target title:(NSString *)title action:(SEL)action;
- (void) setLeftBarButtonItemWithActionAndTitle:(id)target title:(NSString *)title action:(SEL)action;

@end
