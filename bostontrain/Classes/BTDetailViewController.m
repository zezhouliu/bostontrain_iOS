//
//  BTDetailViewController.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTDetailViewController.h"
#import "BTViewController.h"
#import "BTRequest.h"
#import "BTJSONParser.h"

@interface BTDetailViewController ()
- (void)configureView;
@end

@implementation BTDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSString *url = [BTRequest getArrivalsDeparturesWithStop:@"Back Bay" route:@"" direction:@"" datetime:@""];
        NSLog(@"%@", url);
        
        BTJSONParser *btparser = [[BTJSONParser alloc] init];
//        [btparser getDataWithAPI:url];
        
        [btparser getDataWithAPI:@"http://developer.mbta.com/lib/rthr/red.json"];
        
//        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
