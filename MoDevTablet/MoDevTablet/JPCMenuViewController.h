//
//  JPCMenuViewController.h
//  MoDevTablet
//
//  Created by John Cromartie on 9/11/12.
//  Copyright (c) 2012 John Cromartie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPCMenuViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *items;

- (void)addItemWithTitle:(NSString *)title viewController:(UIViewController *)viewController;

@end
