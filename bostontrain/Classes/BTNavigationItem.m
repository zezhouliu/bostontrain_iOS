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
    UIImage *image = [UIImage imageNamed:@"backbutton.png"];
    UIButton *navButton = [self buttonWithImage:image activeImage:[UIImage imageNamed:@"backbutton_active"]];
    [navButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navButton];
}

- (void)setRightBarButtonItemWithAction:(id)target action:(SEL)action
{
    UIImage *image = [UIImage imageNamed:@"backbutton.png"];
    UIButton *navButton = [self buttonWithImage:image activeImage:[UIImage imageNamed:@"backbutton_active"]];
    [navButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navButton];
}

- (UIButton *)buttonWithImage:(UIImage *)image activeImage:(UIImage *)activeImage
{
    UIButton *navButton = [UIButton buttonWithType:UIButtonTypeCustom];
    navButton.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    [navButton setImage:image forState:UIControlStateNormal];
    if (activeImage) {
        [navButton setImage:activeImage forState:UIControlStateHighlighted];
    }
    return navButton;
}
@end
