//
//  ViewController.m
//  CSTrackingSlider
//
//  Created by shenqi329 on 14-9-20.
//  Copyright (c) 2014年 shenqi329. All rights reserved.
//

#import "ViewController.h"
#import "CSTrackingSlider.h"

@interface ViewController ()

@property(nonatomic,retain) CSTrackingSlider *slider;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.slider  = [[CSTrackingSlider alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - 100, self.view.bounds.size.width, 100)];
    
    [self.view addSubview:self.slider];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
