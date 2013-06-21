//
//  BTNavigationItem.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTNavigationItem.h"

@implementation UINavigationItem (BT)

- (void)setLeftBarButtonItemWithActionAndTitle:(id)target title:(NSString *)title action:(SEL)action
{
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
//    self.leftBarButtonItem.target = target;
//    self.leftBarButtonItem.action = action;
}

- (void)setRightBarButtonItemWithActionAndTitle:(id)target title:(NSString *)title action:(SEL)action
{
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:action];
//    self.rightBarButtonItem = [[UIBarButtonItem alloc] init];
//    self.rightBarButtonItem.target = target;
//    self.rightBarButtonItem.action = action;
}

@end
