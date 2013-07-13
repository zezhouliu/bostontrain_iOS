//
//  BTHomeViewController.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTHomeViewController.h"
#import "BTAlertsViewController.h"
#import <UIKit/UIKit.h>
#import "FlatUIKit.h"
#import "RedLineViewController.h"
#import "GreenLineViewController.h"
#import "BlueLineViewController.h"
#import "OrangeLineViewController.h"
#import "BTRequest.h"


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define SUBWAY_VALUE @"Subway"

@interface BTHomeViewController ()
{
    CGFloat content_start;
}

@property (nonatomic, strong) BTView *alertHeader;

@end

@implementation BTHomeViewController

/* * * * * * * * * *
 * Initialization: Try NOT to use nib files
 * params: none
 * returns: BTHomeViewController
 * * * * * * * * * */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Boston T-line";
        self.view.autoresizesSubviews = YES;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

/* * * * * * * * * *
 * viewDidLoad: As our view loads, we need to setup several components
 * Components: NavigationBar, SearchBar, OptionButtons
 * * * * * * * * * */
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    /* = = = = = = TESTING BLOCK = = = = = = */
    BOOL test = YES;
    if (test) {
        
//        BTRequest *request = [BTRequest getStopListByRouteWithDelegate:self route:@"746" succeedSelector:@selector(getArrivalsDeparturesByStopRequestDidSucceed:)];
        BTRequest *request1 = [BTRequest getArrivalsDeparturesByStopWithDelegate:self stopId:@"70065" route:@"" direction:@"" datetime:@"" succeedSelector:@selector(getArrivalsDeparturesByStopRequestDidSucceed:)];
        
        BTRequest *request = [BTRequest getStopListByRouteWithDelegate:self route:@"931_" succeedSelector:@selector(getStopListRequestDidSucceed:)];
        [self.requestQueue addOperation:request1];
    }
    /* = = = = = = TESTING BLOCK = = = = = = */
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        // have a
        content_start = 50;
        
    }
    else {
        
    }
    
//    [self pullRouteListing];
    [self setupNavigationBar];
    [self setupRoutePlanner];
    [self setupSearchBar];
    [self setupOptionButtons];
    [self.view.layer setBorderColor:[[UIColor redColor] CGColor]];
    [self.view.layer setBorderWidth:5];
//    [self addAlertSection];

}

# pragma mark - page loading
/* * * * * * * * *
 * setupRoutePlanner sets up 2 textfields to query trip planner
 * params: none
 * returns void
 * * * * * * * * */
- (void) setupRoutePlanner
{
    self.routePlannerBar.frame = CGRectMake(0, content_start, self.view.frame.size.width, 55);
    self.routePlannerBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.fromField.frame = CGRectMake(0, 0, self.view.frame.size.width / 2, 50);
    self.toField.frame = CGRectMake(self.fromField.frame.origin.x + self.fromField.frame.size.width,
                                    self.fromField.frame.origin.y, self.fromField.frame.size.width, self.fromField.frame.size.height);
    self.routePlannerBar.backgroundColor = [UIColor sunflowerColor];
    [self.view addSubview:self.routePlannerBar];
}



/* * * * * * * * *
 * setupSearchBar sets up the search bar
 * params: none
 * returns void
 * * * * * * * * */
- (void) setupSearchBar
{
    
}



/* * * * * * * * *
 * setupOptionButtons generates our buttons that allows users
 *     to choose which train line they want information about
 *     Currently supports: red, blue, orange, green
 * params: none
 * returns void
 * * * * * * * * */
- (void) setupOptionButtons
{
    
    // redLine button on top left
    
    self.redLineButton.frame = CGRectMake(0, self.routePlannerBar.frame.origin.y + self.routePlannerBar.frame.size.height, self.view.frame.size.width / 2, (self.view.frame.size.height / 2) - 50);
    [self.redLineButton addTarget:self action:@selector(redButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.redLineButton];
    
    // blue line button on top right
    self.blueLineButton.frame = CGRectMake(self.redLineButton.frame.origin.x + self.redLineButton.frame.size.width,
                                    self.redLineButton.frame.origin.y, self.view.frame.size.width - self.redLineButton.frame.size.width,
                                    self.redLineButton.frame.size.height);
    [self.blueLineButton addTarget:self action:@selector(blueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.blueLineButton];
    
    // orange line button on the bottom left
    self.orangeLineButton.frame = CGRectMake(self.redLineButton.frame.origin.x, self.redLineButton.frame.origin.y + self.redLineButton.frame.size.height,
                                       self.redLineButton.frame.size.width, self.redLineButton.frame.size.height);
    [self.orangeLineButton addTarget:self action:@selector(orangeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.orangeLineButton];
    
    // green line button on the bottom right
    self.greenLineButton.frame = CGRectMake(self.orangeLineButton.frame.origin.x + self.orangeLineButton.frame.size.width, self.orangeLineButton.frame.origin.y,
                                      self.blueLineButton.frame.size.width, self.orangeLineButton.frame.size.height);   
    [self.greenLineButton addTarget:self action:@selector(greenButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.greenLineButton];
    
//    NSLog(@"Red button: %@, height: %f, Green button: %@, height: %f", self.redLineButton, self.redLineButton.frame.size.height, self.greenLineButton, self.greenLineButton.frame.size.height);
    
}

- (void) redButtonClicked
{
    RedLineViewController *rlvc = [[RedLineViewController alloc] init];
    rlvc.routeArray = self.redLineRouteIDs;
    [self.navigationController pushViewController:rlvc animated:YES];
    
}

- (void) blueButtonClicked
{
    BlueLineViewController *blvc = [[BlueLineViewController alloc] init];
    blvc.routeArray = self.blueLineRouteIDs;
    [self.navigationController pushViewController:blvc animated:YES];
    
}

- (void) greenButtonClicked
{
    GreenLineViewController *glvc = [[GreenLineViewController alloc] init];
    glvc.routeArray = self.greenLineRouteIDs;
    [self.navigationController pushViewController:glvc animated:YES];
}

- (void) orangeButtonClicked
{
    OrangeLineViewController *olvc = [[OrangeLineViewController alloc] init];
    olvc.routeArray = self.orangeLineRouteIDs;
    [self.navigationController pushViewController:olvc animated:YES];
}

# pragma mark - subviews
/* * * * * * *
 * In this section, we lazy load our subviews
 * by only allocating memory for them if they do not already exist
 * * * * * * */

- (BTView *) routePlannerBar
{
    if (!_routePlannerBar) {
        _routePlannerBar = [[BTView alloc] initWithFrame:CGRectZero];
    }
    
    return _routePlannerBar;
}

- (FUIButton *) redLineButton
{
    if (!_redLineButton) {
        _redLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _redLineButton.backgroundColor = [UIColor alizarinColor];
        _redLineButton.buttonColor = [UIColor alizarinColor];
        _redLineButton.shadowColor = [UIColor pomegranateColor];
        [_redLineButton setAutoresizingMask:UIViewAutoresizingFlexibleWidth];

        _redLineButton.shadowHeight = 5.0f;
        _redLineButton.cornerRadius = 0.0f;
        _redLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_redLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_redLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        
    }
    
    return _redLineButton;
}

- (FUIButton *) blueLineButton
{
    if (!_blueLineButton) {
        _blueLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _blueLineButton.backgroundColor = [UIColor peterRiverColor];
        _blueLineButton.buttonColor = [UIColor peterRiverColor];
        _blueLineButton.shadowColor = [UIColor belizeHoleColor];
        _blueLineButton.shadowHeight = 5.0f;
        _blueLineButton.cornerRadius = 0.0f;
        _blueLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_blueLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_blueLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
    
    return _blueLineButton;
}

- (FUIButton *) greenLineButton
{
    if (!_greenLineButton) {
        _greenLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _greenLineButton.backgroundColor = [UIColor emerlandColor];
        _greenLineButton.buttonColor = [UIColor emerlandColor];
        _greenLineButton.shadowColor = [UIColor nephritisColor];
        _greenLineButton.shadowHeight = 5.0f;
        _greenLineButton.cornerRadius = 0.0f;
        _greenLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_greenLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_greenLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
    
    return _greenLineButton;
}

- (FUIButton *) orangeLineButton
{
    if (!_orangeLineButton) {
        _orangeLineButton = [[FUIButton alloc] initWithFrame:CGRectZero];
        _orangeLineButton.backgroundColor = [UIColor carrotColor];
        _orangeLineButton.buttonColor = [UIColor carrotColor];
        _orangeLineButton.shadowColor = [UIColor pumpkinColor];
        _orangeLineButton.shadowHeight = 5.0f;
        _orangeLineButton.cornerRadius = 0.0f;
        _orangeLineButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        [_orangeLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
        [_orangeLineButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    }
    
    return _orangeLineButton;
}
- (void) addAlertSection
{
    self.alertHeader = [[BTView alloc] initWithFrame:CGRectMake(-5, 0, self.view.frame.size.width + 15, 35)];

    UIImageView *alertViewImg = [[UIImageView alloc] initWithFrame:self.alertHeader.frame];
    alertViewImg.backgroundColor = [UIColor greenColor];
    alertViewImg.image = [UIImage imageNamed:@"red_button.png"];
    [self.alertHeader addSubview:alertViewImg];
    
    UILabel *alertViewHeaderText = [[UILabel alloc] initWithFrame:self.alertHeader.frame];
    alertViewHeaderText.backgroundColor = [UIColor clearColor];
    alertViewHeaderText.textAlignment = NSTextAlignmentCenter;
    alertViewHeaderText.text = @"Recent MBTA alerts";
    [self.alertHeader addSubview:alertViewHeaderText];
    
    [self.view addSubview:self.alertHeader];
    
}

# pragma mark - navigation buttons
- (void) setupNavigationBar
{
    [self addRightButton];
}

- (void) addRightButton
{
    
    [self.navigationItem setRightBarButtonItemWithActionAndTitle:self title:@"" action:@selector(rightButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem.style = UIBarButtonSystemItemDone;
    self.navigationItem.rightBarButtonItem.title = @"Alex";
}

- (void) rightButtonClicked: (id) sender
{
    BTAlertsViewController *alertViewController = [[BTAlertsViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:alertViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Requests
- (void) pullRouteListing
{
    BTRequest *request = [BTRequest getRouteListWithDelegate:self succeedSelector:@selector(getRouteRequestDidSucceed:)];
    [self.requestQueue addOperation:request];
}

- (void) getRouteRequestDidSucceed: (BTRequest *) request
{
    if ([request.responseDict objectForKey:@"mode"]) {
        // Array of all routes of all commute type (i.e. subway, ferry, etc)
        self.routesArray = [request.responseDict objectForKey:@"mode"];
        
        if (self.routesArray) {
            for (int i = 0; i < [self.routesArray count]; i++) {
                
                // routeDicts is the dictionary for each commute type
                NSDictionary *routeDicts = [self.routesArray objectAtIndex:i];
                
                // if the dict is for a subway, we grab the array of all routes and add to oure self.subwayRoutesArray
                if ([routeDicts objectForKey:@"mode_name"] && ([[routeDicts objectForKey:@"mode_name"] isEqualToString:SUBWAY_VALUE]) && [[routeDicts objectForKey:@"route"] isKindOfClass:[NSArray class]]) {
                    NSArray *subwayRoutes = [routeDicts objectForKey:@"route"];
                    [self.subwayRoutesArray addObjectsFromArray:subwayRoutes];
                    
                    // Here, we do additional parsing to store arrays for each subway line (Red, Green, Blue, etc);
                    for (int j = 0; j < [subwayRoutes count]; j++) {
                        NSDictionary *route = [subwayRoutes objectAtIndex:j];
                        if (route && [route objectForKey:@"route_name"]) {
                            if ([[route objectForKey:@"route_name"] isEqualToString:@"Green Line"]){
                                [self.greenLineRouteIDs addObject:[route objectForKey:@"route_id"]];
                            }
                            else if ([[route objectForKey:@"route_name"] isEqualToString:@"Red Line"]){
                                [self.redLineRouteIDs addObject:[route objectForKey:@"route_id"]];
                            }
                            else if ([[route objectForKey:@"route_name"] isEqualToString:@"Blue Line"]){
                                [self.blueLineRouteIDs addObject:[route objectForKey:@"route_id"]];
                            }
                            else if ([[route objectForKey:@"route_name"] isEqualToString:@"Orange Line"]){
                                [self.orangeLineRouteIDs addObject:[route objectForKey:@"route_id"]];
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

- (void) getStopListRequest: (NSString *) route
{
    BTRequest *request = [BTRequest getStopListByRouteWithDelegate:self route:route succeedSelector:@selector(getStopListRequestDidSucceed:)];
    [self.requestQueue addOperation:request];
}

- (void) getStopListRequestDidSucceed: (BTRequest *) request
{
    NSLog(@"RESULTS: %@", request.responseDict);
    if (request.responseDict) {
        NSArray *directionRoute = [request.responseDict objectForKey:@"direction"];
        for (int i = 0; i < [directionRoute count]; i++) {
            if ([[directionRoute objectAtIndex:i] isKindOfClass:[NSDictionary class]] && [[directionRoute objectAtIndex:i] objectForKey:@"direction_name"]){
                if ([[[directionRoute objectAtIndex:i] objectForKey:@"direction_name"] isEqualToString:@"Outbound"]){
                    self.outboundStops = [[directionRoute objectAtIndex:i] objectForKey:@"stop"];
                }
                else if ([[[directionRoute objectAtIndex:i] objectForKey:@"direction_name"] isEqualToString:@"Inbound"]){
                    self.inboundStops = [[directionRoute objectAtIndex:i] objectForKey:@"stop"];
                }
            }
        }
    }
    
}

- (void) getArrivalsDeparturesByStopRequestDidSucceed: (BTRequest *) request
{
    NSLog(@"Request result: %@", request.responseDict);
    
    if (request.responseDict) {
        if ([request.responseDict objectForKey:@"mode"]) {
            // Array of all routes of all commute type (i.e. subway, ferry, etc)
            NSArray *routesArray = [request.responseDict objectForKey:@"mode"];
            if (routesArray) {
                for (int i = 0; i < [self.routesArray count]; i++) {
                    
                    // routeDicts is the dictionary for each commute type
                    NSDictionary *routeDicts = [self.routesArray objectAtIndex:i];
                    
                    // if the dict is for a subway, we grab the array of all routes and add to oure self.subwayRoutesArray
                    if ([routeDicts objectForKey:@"mode_name"] && ([[routeDicts objectForKey:@"mode_name"] isEqualToString:SUBWAY_VALUE]) && [[routeDicts objectForKey:@"route"] isKindOfClass:[NSArray class]]) {
                        NSArray *subwayRoutes = [routeDicts objectForKey:@"route"];
                        [self.subwayRoutesArray addObjectsFromArray:subwayRoutes];
                        
                        // Here, we do additional parsing to store arrays for each subway line (Red, Green, Blue, etc);
                        for (int j = 0; j < [subwayRoutes count]; j++) {
                            NSDictionary *directionRoute = [subwayRoutes objectAtIndex:j];
                            if (directionRoute && [directionRoute objectForKey:@"direction"] && [[directionRoute objectForKey:@"directon"] isKindOfClass:[NSArray class]]) {
                                NSArray *directionArray = [directionRoute objectForKey:@"direction"];
                                
                                for (int k = 0; k < [directionArray count]; k ++) {
                                    if ([[directionArray objectAtIndex:k] isKindOfClass:[NSDictionary class]]) {
                                        if ([[directionArray objectAtIndex:k] objectForKey:@"route_id"] && [[[directionArray objectAtIndex:k] objectForKey:@"direction_name"] isEqualToString:@"931_"]) {
                                            self.ashmont = [directionArray objectAtIndex:k];
                                        }
                                        else if ([[directionArray objectAtIndex:k] objectForKey:@"route_id"] && [[[directionArray objectAtIndex:k] objectForKey:@"direction_name"] isEqualToString:@"933_"]) {
                                            self.braintree = [directionArray objectAtIndex:k];
                                        }
                                    }
                                }
                                    
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    /**
     {
     mode =     (
     {
     "mode_name" = Subway;
     route =             (
     {
     direction =                     (
     {
     "direction_id" = 0;
     "direction_name" = Southbound;
     trip =                             (
     {
     "sch_arr_dt" = 1373688060;
     "sch_dep_dt" = 1373688060;
     "trip_id" = 20222555;
     "trip_name" = "11:56 pm from Alewife Station Red Line to Ashmont Station - Red Line";
     },
     {
     "sch_arr_dt" = 1373688900;
     "sch_dep_dt" = 1373688900;
     "trip_id" = 20222537;
     "trip_name" = "12:10 am from Alewife Station Red Line to Ashmont Station - Red Line";
     },
     {
     "sch_arr_dt" = 1373689620;
     "sch_dep_dt" = 1373689620;
     "trip_id" = 20222544;
     "trip_name" = "12:22 am from Alewife Station Red Line to Ashmont Station - Red Line";
     }
     );
     }
     );
     "route_id" = "931_";
     "route_name" = "Red Line";
     },
     {
     direction =                     (
     {
     "direction_id" = 0;
     "direction_name" = Southbound;
     trip =                             (
     {
     "sch_arr_dt" = 1373688480;
     "sch_dep_dt" = 1373688480;
     "trip_id" = 20222618;
     "trip_name" = "12:03 am from Alewife Station Red Line to Braintree Station Red Line Platform";
     },
     {
     "sch_arr_dt" = 1373689200;
     "sch_dep_dt" = 1373689200;
     "trip_id" = 20222624;
     "trip_name" = "12:15 am from Alewife Station Red Line to Braintree Station Red Line Platform";
     }
     );
     }
     );
     "route_id" = "933_";
     "route_name" = "Red Line";
     }
     );
     "route_type" = 1;
     }
     );
     "stop_id" = 70065;
     "stop_name" = "Porter Sq - Inbound";
     }

     **/
    
}

# pragma mark - properties
/* * * * * * * * * *
 * subwayRoutesArray is an array containing dictionaries with 2 KV pairs
 * Key: route_id; Value: # (i.e 810)
 * Key: route_name; Value: NSString (i.e. Green Line)
 * * * * * * * * * */
- (NSMutableArray *) subwayRoutesArray
{
    if (!_subwayRoutesArray) {
        _subwayRoutesArray = [[NSMutableArray alloc] init];
    }
    
    return _subwayRoutesArray;
}

/* * * * * * * * * *
 * greenLineRouteIDs is an array containing the route ids for green line
 *
 * * * * * * * * * */
- (NSMutableArray *) greenLineRouteIDs
{
    if (!_greenLineRouteIDs) {
        _greenLineRouteIDs = [[NSMutableArray alloc] init];
    }
    
    return _greenLineRouteIDs;
}

/* * * * * * * * * *
 * redLineRouteIDs is an array containing the route ids for red line
 *
 * * * * * * * * * */
- (NSMutableArray *) redLineRouteIDs
{
    if (!_redLineRouteIDs) {
        _redLineRouteIDs = [[NSMutableArray alloc] init];
    }
    
    return _redLineRouteIDs;
}

/* * * * * * * * * *
 * blueLineRouteIDs is an array containing the route ids for blue line
 *
 * * * * * * * * * */
- (NSMutableArray *) blueLineRouteIDs
{
    if (!_blueLineRouteIDs) {
        _blueLineRouteIDs = [[NSMutableArray alloc] init];
    }
    
    return _blueLineRouteIDs;
}

/* * * * * * * * * *
 * orangeLineRouteIDs is an array containing the route ids for orange line
 *
 * * * * * * * * * */
- (NSMutableArray *) orangeLineRouteIDs
{
    if (!_orangeLineRouteIDs) {
        _orangeLineRouteIDs = [[NSMutableArray alloc] init];
    }
    
    return _orangeLineRouteIDs;
}


/* * * * * * * * * * * *
 Should I include SilverLine?
 
 {
 "route_id" = 746;
 "route_name" = "Silver Line";
 },
 {
 "route_id" = 741;
 "route_name" = SL1;
 },
 {
 "route_id" = 742;
 "route_name" = SL2;
 },
 {
 "route_id" = 751;
 "route_name" = SL4;
 },
 {
 "route_id" = 749;
 "route_name" = SL5;
 },
**/


@end
