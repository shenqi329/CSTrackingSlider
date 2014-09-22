//
//  CSTrackingCursor.h
//  CSTrackingSlider
//
//  Created by shenqi329 on 14-9-22.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSTrackingCursor : UIButton

@property(nonatomic,assign) BOOL   draggable;

- (void)setTrackRect:(CGRect) rect;

@end
