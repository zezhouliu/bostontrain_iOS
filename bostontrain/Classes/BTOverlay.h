//
//  BTOverlay.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface BTOverlay : UIView

// properties
@property (nonatomic, strong) UIView *loadingView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, strong) UILabel *activityLabel;
@property (nonatomic, strong) NSNumber *edgeSize;
@property (nonatomic, strong) NSNumber *showActivity;


// Overlays
- (id)initWithFrame:(CGRect)frame currentView:(UIView *)currentView labelString:(NSString *)labelString edgeLength:(NSNumber *)edgeLength animated:(BOOL)animated;
// remove Overlay
- (void) hideOverlay: (BOOL)animated;

@end
