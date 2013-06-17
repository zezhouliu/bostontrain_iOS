//
//  BTOverlay.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTOverlay.h"
#import <QuartzCore/QuartzCore.h>
#import "BTAppDelegate.h"

@interface BTOverlay ()
{
    CGFloat defaultLength;
    CGFloat vt_gap;
}

@property (nonatomic, strong) UIView *framingView;

@end

@implementation BTOverlay

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//    }
//    return self;
//}

- (id)initWithFrame:(CGRect)frame currentView:(UIView *)currentView labelString:(NSString *)labelString edgeLength:(NSNumber *)edgeLength animated:(BOOL)animated
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"Reached method");
        vt_gap = 10;
        
        self.frame = currentView.bounds;
        self.alpha = 0;
        
        // Create frame in center of currentView
        [self makeFramingView:edgeLength];
        
        // place indicator in center of framingView:
        CGRect indicatorFrame = self.activityIndicator.frame;
        indicatorFrame.origin.x = self.framingView.frame.origin.x + (self.framingView.frame.size.width - indicatorFrame.size.width) / 2;
        indicatorFrame.origin.y = self.framingView.frame.origin.y + (self.framingView.frame.size.height - indicatorFrame.size.height) / 2;
        self.activityIndicator.frame = indicatorFrame;
        
        // if labelString, show it as message
        if (labelString)
        {
            self.activityLabel.text = labelString;
            self.activityLabel.hidden = NO;
        }
        else {
            self.activityLabel.hidden = YES;
        }
        
        CGSize textSize = [self.activityLabel.text sizeWithFont:[UIFont systemFontOfSize:50]];
        self.activityLabel.frame = CGRectMake(self.framingView.frame.origin.x, indicatorFrame.origin.y + indicatorFrame.size.height, self.framingView.frame.size.width, textSize.height);
        
        // add components
        [self addSubview:self.framingView];
        [self addSubview:self.activityLabel];
        [self addSubview:self.activityIndicator];
        
        // add overlay to currentView
        [currentView addSubview:self];
        
        // if animated, add the video
        if (animated) {
            
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
                self.alpha = 1;
            }completion:^(BOOL completion) {
                //add completion block
            }];
        }
        else {
            self.alpha = 1;
        }
        return self;
    }
    return self;
}


// set-up subviews
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    self.framingView.center = self.center;

}

- (void)makeFramingView:(NSNumber *) edgeLength
{
    defaultLength = self.frame.size.width / 2;
    
    if (edgeLength)
    {
        CGRect fr = self.frame;
        fr.size.height = [edgeLength floatValue];
        fr.size.width = [edgeLength floatValue];
        fr.origin.x = ((self.frame.size.width - fr.size.width) / 2);
        fr.origin.y = ((self.frame.size.height - fr.size.height) / 2);
        self.framingView.frame = fr;
    }
    else {
        CGRect fr = CGRectMake(((self.frame.size.width - defaultLength) / 2), ((self.frame.size.height - defaultLength) / 2), defaultLength, defaultLength);
        self.framingView.frame = fr;
    }

    [self.framingView.layer setMasksToBounds:YES];
}

- (UIView *)makeBorderView;
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    
    view.opaque = NO;
    view.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    return view;
}

# pragma mark - lazy loading page elements
// lazy load activity indicator
- (UIActivityIndicatorView *)activityIndicator;
{
    if (!_activityIndicator)
    {
        _activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_activityIndicator startAnimating];
    }
    
    return _activityIndicator;
}


// lazy load activity label
- (UILabel *)activityLabel;
{
    
    if (!_activityLabel)
    {
        _activityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _activityLabel.font = [UIFont systemFontOfSize:15];
        _activityLabel.textAlignment = NSTextAlignmentCenter;
        _activityLabel.textColor = [UIColor whiteColor];
        _activityLabel.backgroundColor = [UIColor clearColor];
        
    }
    
    return _activityLabel;
}

// lazy load the framing view
// the framing view is the gray container holding the loading spinner
- (UIView *) framingView
{
    if (!_framingView)
    {
        _framingView = [[UIView alloc] initWithFrame:CGRectZero];
        _framingView.opaque = NO;
        _framingView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin
            | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        _framingView.layer.cornerRadius = 10.0;
        _framingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    }
    
    return _framingView;
}


// hide the overlay by removing from superView
- (void) hideOverlay: (BOOL)animated
{
    if ([self respondsToSelector:@selector(removeFromSuperview)])
    {
        if (animated) {
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
                self.alpha = 0;
                [self performSelector:@selector(removeFromSuperview) withObject:nil];
            }completion:^(BOOL finished) {
                
            }];
        }
        else {
            [self performSelector:@selector(removeFromSuperview) withObject:nil];
        }
    }
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
