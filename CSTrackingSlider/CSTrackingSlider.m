//
//  CSTrackingSlider.m
//  CSTrackingSlider
//
//  Created by shenqi329 on 14-9-20.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "CSTrackingSlider.h"

@implementation CSTrackingSlider

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    NSUInteger totalPart = 0;
    
    for (PartInfo *info in self.partInfoArray) {
        totalPart += info.part;
    }
    CGContextClearRect(UIGraphicsGetCurrentContext(),rect);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGRect rectangle= CGRectMake(20, 20 , self.bounds.size.width - 40, 20);
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:rectangle cornerRadius:2.0];
    CGContextAddPath(context, roundedRectPath.CGPath);
    //CGContextAddRect(context, rectangle);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    
    
}

@end
