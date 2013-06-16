//
//  BTDetailViewController.m
//  bostontrain
//
//  Created by Alex Liu on 6/15/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTDetailViewController.h"
#import "BTViewController.h"

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
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    UIButton *newbtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    newbtn.backgroundColor = [UIColor redColor];
    [newbtn addTarget:self action:@selector(loadBTViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newbtn];
}


- (void) loadBTViewController: (id) sender
{
    NSLog(@"Button pressed");
    BTViewController *btvc = [[BTViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:btvc animated:YES];
    [btvc showOverlay];
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
