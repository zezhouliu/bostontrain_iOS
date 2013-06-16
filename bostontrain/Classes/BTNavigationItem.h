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
- (void) setLeftBarButtonItemWithAction:(id) target action:(SEL)action;
- (void) setRightBarButtonItemWithAction:(id) target action:(SEL)action;

- (UIButton *)buttonWithImage:(UIImage *)image activeImage:(UIImage *)activeImage;

@end
