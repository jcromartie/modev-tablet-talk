//
//  JPCBlockLoadingViewController.h
//  MoDevTablet
//
//  Created by John Cromartie on 9/11/12.
//  Copyright (c) 2012 John Cromartie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPCBlockLoadingViewController : UIViewController

@property (nonatomic, strong) void (^viewDidLoadBlock)(UIViewController *vc);

@end
