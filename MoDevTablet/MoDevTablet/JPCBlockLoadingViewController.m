//
//  JPCBlockLoadingViewController.m
//  MoDevTablet
//
//  Created by John Cromartie on 9/11/12.
//  Copyright (c) 2012 John Cromartie. All rights reserved.
//

#import "JPCBlockLoadingViewController.h"

@interface JPCBlockLoadingViewController ()

@end

@implementation JPCBlockLoadingViewController

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
    NSLog(@"START viewDidLoad: %@", self.title);
    [super viewDidLoad];
    self.viewDidLoadBlock(self);
    NSLog(@"END viewDidLoad: %@", self.title);
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear: %@", self.title);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.view = nil;
}

@end
