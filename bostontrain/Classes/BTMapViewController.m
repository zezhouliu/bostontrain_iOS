//
//  BTMapViewController.m
//  bostontrain
//
//  Created by Alex Liu on 7/9/13.
//  Copyright (c) 2013 Alex Liu. All rights reserved.
//

#import "BTMapViewController.h"

@interface BTMapViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation BTMapViewController

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
    
    self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - subviews

- (UIScrollView *) scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    
    return _scrollView;
}

@end
