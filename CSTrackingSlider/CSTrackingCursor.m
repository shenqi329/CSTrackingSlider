//
//  CSTrackingCursor.m
//  CSTrackingSlider
//
//  Created by shenqi329 on 14-9-22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "CSTrackingCursor.h"

@interface CSTrackingCursor()
{
    BOOL _singleTapBeenCanceled;
    CGPoint _beginLocation;
    UILongPressGestureRecognizer *_longPressGestureRecognizer;
    CGRect _trackRect;
}

@property(nonatomic,assign,readonly) BOOL isDragging;

@end


@implementation CSTrackingCursor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _draggable = YES;
    }
    return self;
}

- (void)setTrackRect:(CGRect) rect
{
    _trackRect = rect;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    _isDragging = NO;

    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 2) {
        _singleTapBeenCanceled = YES;
    }else{
        _singleTapBeenCanceled = NO;
    }
    
    _beginLocation = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[super touchesMoved:touches withEvent:event];
    NSLog(@"touchesMove");
    if (_draggable) {
        _isDragging = YES;
        UITouch *touch = [touches anyObject];
        
        CGPoint currentLocation = [touch locationInView:self];
        
        float offsetX = currentLocation.x - _beginLocation.x;
        float offsetY = currentLocation.y - _beginLocation.y;
        NSLog(@"%f %f",offsetX,offsetY);
        self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
        
        /*
        CGRect superviewFrame = self.superview.frame;
        CGRect frame = self.frame;
        CGFloat leftLimitX = frame.size.width / 2;
        CGFloat rightLimitX = superviewFrame.size.width - leftLimitX;
        CGFloat topLimitY = frame.size.height / 2;
        CGFloat bottomLimitY = superviewFrame.size.height - topLimitY;
        
        if (self.center.x > rightLimitX) {
            self.center = CGPointMake(rightLimitX, self.center.y);
        }else if (self.center.x <= leftLimitX) {
            self.center = CGPointMake(leftLimitX, self.center.y);
        }
        
        if (self.center.y > bottomLimitY) {
            self.center = CGPointMake(self.center.x, bottomLimitY);
        }else if (self.center.y <= topLimitY){
            self.center = CGPointMake(self.center.x, topLimitY);
        }*/
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded: touches withEvent: event];
    NSLog(@"touchesEnded");
    _isDragging = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    NSLog(@"touchesCancelled");
    //_isDragging = NO;
}


@end
