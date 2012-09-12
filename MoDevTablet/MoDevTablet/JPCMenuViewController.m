//
//  JPCMenuViewController.m
//  MoDevTablet
//
//  Created by John Cromartie on 9/11/12.
//  Copyright (c) 2012 John Cromartie. All rights reserved.
//

#import "JPCMenuViewController.h"

@implementation JPCMenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.items = [NSMutableArray array];
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)addItemWithTitle:(NSString *)title viewController:(UIViewController *)viewController
{
    [self.items addObject:[NSDictionary dictionaryWithObjectsAndKeys:title, @"title", viewController, @"viewController", nil]];
    if (self.isViewLoaded) {
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = [item objectForKey:@"title"];
    
    return cell;
}

# pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = [self.items objectAtIndex:indexPath.row];
    UIViewController *detailViewController = [item objectForKey:@"viewController"];
    detailViewController.title = [item objectForKey:@"title"];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
