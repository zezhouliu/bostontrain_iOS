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

# pragma mark - Buttons
- (FUIButton *) realTimeButton
{
    if (_realTimeButton) {
        _realTimeButton = [[FUIButton alloc] init];
        _realTimeButton.buttonColor = self.buttonColor;
        _realTimeButton.shadowColor = self.buttonShadowColor;
        _realTimeButton.shadowHeight = 5.0f;
        _realTimeButton.cornerRadius = 5.0f;
        _realTimeButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_realTimeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_realTimeButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_realTimeButton setTitle:@"Real Time Tracking" forState:UIControlStateNormal];
        
    }
    
    return _realTimeButton;
}

- (FUIButton *) nextArrivalButton
{
    if (_nextArrivalButton) {
        _nextArrivalButton = [[FUIButton alloc] init];
        _nextArrivalButton.buttonColor = self.buttonColor;
        _nextArrivalButton.shadowColor = self.buttonShadowColor;
        _nextArrivalButton.shadowHeight = 5.0f;
        _nextArrivalButton.cornerRadius = 5.0f;
        _nextArrivalButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_nextArrivalButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_nextArrivalButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_nextArrivalButton setTitle:@"Next Arrival" forState:UIControlStateNormal];
        
    }
    
    return _nextArrivalButton;
}

- (FUIButton *) scheduleButton
{
    if (_scheduleButton) {
        _scheduleButton = [[FUIButton alloc] init];
        _scheduleButton.buttonColor = self.buttonColor;
        _scheduleButton.shadowColor = self.buttonShadowColor;
        _scheduleButton.shadowHeight = 5.0f;
        _scheduleButton.cornerRadius = 5.0f;
        _scheduleButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_scheduleButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_scheduleButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_scheduleButton setTitle:@"Schedule" forState:UIControlStateNormal];
        
    }
    
    return _scheduleButton;
}

- (FUIButton *) mapButton
{
    if (_mapButton) {
        _mapButton = [[FUIButton alloc] init];
        _mapButton.buttonColor = self.buttonColor;
        _mapButton.shadowColor = self.buttonShadowColor;
        _mapButton.shadowHeight = 5.0f;
        _mapButton.cornerRadius = 5.0f;
        _mapButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_mapButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_mapButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        [_mapButton setTitle:@"Map" forState:UIControlStateNormal];
        
    }
    
    return _mapButton;
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
