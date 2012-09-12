//
//  JPCRadialGradientView.m
//  MoDevTablet
//
//  Created by John Cromartie on 9/11/12.
//  Copyright (c) 2012 John Cromartie. All rights reserved.
//

#import "JPCRadialGradientView.h"

@implementation JPCRadialGradientView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIColor *startColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    UIColor *endColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    const void* colorArray[2] = {[startColor CGColor], [endColor CGColor]};
    CFArrayRef colors = CFArrayCreate(NULL, colorArray, 2, NULL);
    const CGFloat locations[2] = {0.0, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColors(rgb, colors, locations);
    CGContextDrawRadialGradient(c, gradient, self.center, MAX(self.bounds.size.height, self.bounds.size.width), self.center, 0, 0);
    CGGradientRelease(gradient);
    CFRelease(colors);
    CGColorSpaceRelease(rgb);
}


@end
