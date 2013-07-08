//
//  TrainViewController.m
//  bostontrain
//
//  Created by Alex Liu on 7/4/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "TrainViewController.h"

@interface TrainViewController ()

@property (nonatomic, strong) FUIButton *realTimeButton;
@property (nonatomic, strong) FUIButton *nextArrivalButton;
@property (nonatomic, strong) FUIButton *scheduleButton;
@property (nonatomic, strong) FUIButton *mapButton;
@property (nonatomic, strong) UIColor *buttonColor;
@property (nonatomic, strong) UIColor *buttonShadowColor;

@end

@implementation TrainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.realTimeButton addTarget:self action:@selector(realTimeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextArrivalButton addTarget:self action:@selector(nextArrivalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scheduleButton addTarget:self action:@selector(scheduleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.mapButton addTarget:self action:@selector(mapButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - button click selectors
- (void) realTimeButtonClicked: (id) sender
{
    // When clicked, we pop up a view for the maps
    // Need to look into Google Maps/Apple Maps API for this
    
}

- (void) nextArrivalButtonClicked: (id) sender
{
    // pop up TableView for next arrivals
}

- (void) scheduleButtonClicked: (id) sender
{
    // pop up a TableView for the schedule or a PDF for the schedule
}

- (void) mapButtonClicked: (id) sender
{
    // either open up the Google Maps / Apple Maps app with loaded information, or
    // embed Apple Maps within Boston Train App
}

@end
