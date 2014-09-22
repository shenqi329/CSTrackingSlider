//
//  CSTrackingSlider.m
//  CSTrackingSlider
//
//  Created by shenqi329 on 14-9-20.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "CSTrackingSlider.h"
#import "CSDraggableButton.h"

@implementation CSPartInfo

@end

@interface CSTrackingSlider()

@property(nonatomic,assign) CGFloat startX;
@property(nonatomic,assign) CGFloat startY;
@property(nonatomic,assign) CGFloat totalWidth;
@property(nonatomic,assign) CGFloat height;

@property(nonatomic,assign) CGFloat cursorLocationX;
@property(nonatomic,assign) CGFloat cursorLocationY;

@property(nonatomic,retain) CSDraggableButton *dragBtn;

@end

@implementation CSTrackingSlider

- (void)defaultSetting
{
    self.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:73.0/255.0 blue:73.0/255.0 alpha:1];
    
    self.startX = 20;
    self.startY = 20;
    self.height = 20;
    self.cursorLocationX = self.startX;
    self.cursorLocationY = self.startY + self.height;
    self.totalWidth = self.bounds.size.width - _startX*2;
    
    self.dragBtn = [[CSDraggableButton alloc] initWithFrame:CGRectMake(0, 40, 40, 40)];
    self.dragBtn.backgroundColor = [UIColor whiteColor];
    [self.dragBtn setDragFrame:CGRectMake(0, 40, self.bounds.size.width, 40)];
    [self addSubview:self.dragBtn];
    
    [self.dragBtn addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
}

-(id)init
{
    self = [super init];
    if (self) {
        [self defaultSetting];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultSetting];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"center"] ) {
        if (object == self.dragBtn) {
            CGPoint center = [[change objectForKey:@"new"] CGPointValue];
            CGFloat percent = (center.x - self.dragBtn.bounds.size.width/2)/(self.bounds.size.width - self.dragBtn.bounds.size.width);
            if (self.trackingBlock) {
                //self.trackingBlock(self,percent);
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGFloat curX = 0;
    NSUInteger totalPart = 0;
    for (CSPartInfo *info in self.partInfoArray) {
        totalPart += info.part;
    }
    CGContextClearRect(UIGraphicsGetCurrentContext(),rect);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGRect rectangle= CGRectMake(_startX, _startY , _totalWidth , self.height);
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:rectangle cornerRadius:0.0];
    CGContextAddPath(context, roundedRectPath.CGPath);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    curX = _startX;
    for (CSPartInfo *info in self.partInfoArray) {
        CGFloat curWidth = (info.part/totalPart)*_totalWidth;
        CGContextSaveGState(context);
        CGRect rectangle = CGRectMake(curX, _startY, curWidth, self.height);
        curX += curWidth;
        CGContextAddRect(context, rectangle);
        CGContextSetFillColorWithColor(context, info.color.CGColor);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
}

@end


















