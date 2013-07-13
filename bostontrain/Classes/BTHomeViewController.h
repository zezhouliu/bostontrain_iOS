//
//  BTHomeViewController.h
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTViewController.h"
#import "BTView.h"
#import "FUIButton.h"
#import <QuartzCore/QuartzCore.h>

@interface BTHomeViewController : BTViewController

@property (nonatomic, strong) BTView *routePlannerBar;
@property (nonatomic, strong) UITextField *fromField;
@property (nonatomic, strong) UITextField *toField;

@property (nonatomic, strong) FUIButton *redLineButton;
@property (nonatomic, strong) FUIButton *orangeLineButton;
@property (nonatomic, strong) FUIButton *greenLineButton;
@property (nonatomic, strong) FUIButton *blueLineButton;
@property (nonatomic, strong) UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray *routesArray;
@property (nonatomic, strong) NSMutableArray *subwayRoutesArray;
@property (nonatomic, strong) NSMutableArray *greenLineRouteIDs;
@property (nonatomic, strong) NSMutableArray *redLineRouteIDs;
@property (nonatomic, strong) NSMutableArray *blueLineRouteIDs;
@property (nonatomic, strong) NSMutableArray *orangeLineRouteIDs;


@property (nonatomic, strong) NSArray *inboundStops;
@property (nonatomic, strong) NSArray *outboundStops;

- (void) redButtonClicked;
- (void) blueButtonClicked;
- (void) orangeButtonClicked;
- (void) greenButtonClicked;


- (void) getRouteRequestDidSucceed: (BTRequest *) request;

@end
