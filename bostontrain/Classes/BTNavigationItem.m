//
//  BTNavigationItem.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTNavigationItem.h"

@implementation UINavigationItem (BT)

- (void)setLeftBarButtonItemWithAction:(id)target action:(SEL)action
{
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:target action:action];
}

- (void)setRightBarButtonItemWithAction:(id)target action:(SEL)action
{
    self.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:target action:action];
}
@end
