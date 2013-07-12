//
//  BTNextArrivalViewController.m
//  bostontrain
//
//  Created by Alex Liu on 7/9/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTNextArrivalViewController.h"

@interface BTNextArrivalViewController ()

@end

@implementation BTNextArrivalViewController

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
    
    self.arrivalTableView.frame = self.view.frame;
    [self.view addSubview:self.arrivalTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - NextArrival Table View
- (UITableView *) arrivalTableView
{
    if (!_arrivalTableView) {
        _arrivalTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _arrivalTableView.delegate = self;
        _arrivalTableView.dataSource = self;
        _arrivalTableView.backgroundColor = [UIColor clearColor];
    }
    
    return _arrivalTableView;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

# pragma mark - requests

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
@end
