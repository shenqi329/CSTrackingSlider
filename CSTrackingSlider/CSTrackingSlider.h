//
//  CSTrackingSlider.h
//  CSTrackingSlider
//
//  Created by shenqi329 on 14-9-20.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CSPartInfo : NSObject

@property(nonatomic,assign) CGFloat     part;     //份数
@property(nonatomic,assign) UIColor     *color;   //用什么颜色显示

@end

@interface CSTrackingSlider : UIView

@property(nonatomic,retain) NSArray *partInfoArray; //PartInfo份数信息

@end
