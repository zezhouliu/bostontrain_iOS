//
//  BTView.m
//  bostontrain
//
//  Created by Alex Liu on 6/20/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTView.h"



@implementation BTView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
