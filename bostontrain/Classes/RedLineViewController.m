//
//  RedLineViewController.m
//  bostontrain
//
//  Created by Alex Liu on 7/5/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "RedLineViewController.h"
#import "FlatUIKit.h"
#import "BTView.h"

@interface RedLineViewController ()
{
    CGFloat content_start;
    CGFloat vertical_gap;
}

@property (nonatomic, strong) FUIButton *realTimeButton;
@property (nonatomic, strong) FUIButton *nextArrivalButton;
@property (nonatomic, strong) FUIButton *scheduleButton;
@property (nonatomic, strong) FUIButton *mapButton;
@property (nonatomic, strong) UIColor *buttonColor;
@property (nonatomic, strong) UIColor *buttonShadowColor;

@property (nonatomic, strong) BTView *trainView;
@property (nonatomic, strong) UIImageView *headerImage;

@end

@implementation RedLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        self.title = @"Red Line";
        self.view.autoresizesSubviews = YES;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
//        // have a
//        content_start = 50;
//        
//    }

    
    self.buttonColor = [UIColor alizarinColor];
    self.buttonShadowColor = [UIColor pomegranateColor];
    content_start = 0;
    vertical_gap = 15;
    
    [self setupTrainHeader];
    [self setupButtons];


	// Do any additional setup after loading the view.
//    [self.view.layer setBorderColor:[[UIColor redColor] CGColor]];
//    [self.view.layer setBorderWidth:5];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - setup subviews

- (void) refreshView
{
    [self setupTrainHeader];
    [self setupButtons];
}

- (void) setupTrainHeader
{
    
    self.trainView.frame = CGRectMake(0, 0, self.view.frame.size.width, 120);
    self.headerImage.frame = self.trainView.bounds;
    self.headerImage.backgroundColor = [UIColor purpleColor];
    
    [self.trainView addSubview:self.headerImage];
    [self.view addSubview:self.trainView];
    

}

- (void) setupButtons
{
    
    self.nextArrivalButton.frame = CGRectMake(0, self.trainView.frame.origin.y + self.trainView.frame.size.height + vertical_gap, self.view.frame.size.width, 50);
    self.scheduleButton.frame = CGRectMake(0, self.nextArrivalButton.frame.origin.y + self.nextArrivalButton.frame.size.height + vertical_gap, self.view.frame.size.width, 50);
    self.realTimeButton.frame = CGRectMake(0, self.scheduleButton.frame.origin.y + self.scheduleButton.frame.size.height + vertical_gap, self.view.frame.size.width, 50);
    self.mapButton.frame = CGRectMake(0, self.realTimeButton.frame.origin.y + self.realTimeButton.frame.size.height + vertical_gap, self.view.frame.size.width, 50);
    
    [self.realTimeButton addTarget:self action:@selector(realTimeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextArrivalButton addTarget:self action:@selector(nextArrivalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.scheduleButton addTarget:self action:@selector(scheduleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.mapButton addTarget:self action:@selector(mapButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextArrivalButton];
    [self.view addSubview:self.scheduleButton];
    [self.view addSubview:self.realTimeButton];
    [self.view addSubview:self.mapButton];
    
}

# pragma mark - header view
- (BTView *) trainView
{
    if (!_trainView) {
        _trainView = [[BTView alloc] initWithFrame:CGRectZero];
    }
    
    return _trainView;
}

- (UIImageView *) headerImage
{
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redline_photo.png"]];
    }
    
    return _headerImage;
}


# pragma mark - Buttons
- (FUIButton *) realTimeButton
{
    if (!_realTimeButton) {
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
    if (!_nextArrivalButton) {
        _nextArrivalButton = [[FUIButton alloc] initWithFrame:CGRectZero];
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
    if (!_scheduleButton) {
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
    if (!_mapButton) {
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
    BTNextArrivalViewController *navcRed = [[BTNextArrivalViewController alloc] init];
    [self.navigationController pushViewController:navcRed animated:YES];
}

- (void) scheduleButtonClicked: (id) sender
{
    // pop up a TableView for the schedule or a PDF for the schedule
    BTScheduleViewController *svcRed = [[BTScheduleViewController alloc] init];
    [self.navigationController pushViewController:svcRed animated:YES];
}

- (void) mapButtonClicked: (id) sender
{
    // either open up the Google Maps / Apple Maps app with loaded information, or
    // embed Apple Maps within Boston Train App
    BTMapViewController *mvcRed = [[BTMapViewController alloc] init];
    [self.navigationController pushViewController:mvcRed animated:YES];
}


@end
