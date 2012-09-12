//
//  JPCAppDelegate.m
//  MoDevTablet
//
//  Created by John Cromartie on 9/11/12.
//  Copyright (c) 2012 John Cromartie. All rights reserved.
//

#import "JPCAppDelegate.h"

#import "JPCMenuViewController.h"
#import "JPCBlockLoadingViewController.h"
#import "JPCRadialGradientView.h"

@implementation JPCAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    JPCMenuViewController *menu = [[JPCMenuViewController alloc] initWithStyle:UITableViewStylePlain];
    
    JPCBlockLoadingViewController *vc;
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [UIImage imageNamed:@"worst-image-ever-ipad"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"worst image ever" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [UIImage imageNamed:@"rainbow-ipad-angle"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"rainbow-ipad-angle" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [UIImage imageNamed:@"rainbow-ipad"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"rainbow-ipad" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [UIImage imageNamed:@"rainbow-ipad-slice"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = vc.view.bounds;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"rainbow-ipad-slice" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        JPCRadialGradientView *gradient = [[JPCRadialGradientView alloc] initWithFrame:vc.view.bounds];
        [vc.view addSubview:gradient];
    };
    [menu addItemWithTitle:@"slow-gradient" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [UIImage imageNamed:@"vignette-ipad"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = vc.view.bounds;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.alpha = 0.25;
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"faster-gradient" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [UIImage imageNamed:@"vignette-200"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = vc.view.bounds;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.alpha = 0.25;
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"fastest-gradient" viewController:vc];
    
    vc = [[JPCBlockLoadingViewController alloc] initWithNibName:nil bundle:nil];
    vc.viewDidLoadBlock = ^(UIViewController *vc) {
        UIImage *image = [[self class] noiseImageWithBounds:self.window.bounds];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [vc.view addSubview:imageView];
    };
    [menu addItemWithTitle:@"gen-noise" viewController:vc];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:menu];
    
    self.window.rootViewController = self.navigationController;
    
    return YES;
}


+ (UIImage *)noiseImageWithBounds:(CGRect)bounds
{
    CGSize size = bounds.size;
    int bytes = size.width * size.height;
    uint8_t *pixels = malloc(sizeof(uint8_t) * bytes);

    SecRandomCopyBytes(kSecRandomDefault, bytes, pixels);
    CGColorSpaceRef gray = CGColorSpaceCreateDeviceGray();
    CGContextRef ctx = CGBitmapContextCreate(pixels, size.width, size.height, 8, size.width, gray, 0);
    CGImageRef img = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:img];
    CGContextRelease(ctx);
    CGColorSpaceRelease(gray);
    free(pixels);
    CGImageRelease(img);
    return returnImage;
}

@end
