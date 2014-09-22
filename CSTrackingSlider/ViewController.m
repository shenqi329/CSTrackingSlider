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
    self.slider  = [[CSTrackingSlider alloc]initWithFrame:CGRectMake(0, self.view.bounds.    size.height - 100, self.view.bounds.size.width, 100)];
    
    CSPartInfo *part1 = [[CSPartInfo alloc]init];
    part1.part = 2;
    part1.color = [UIColor grayColor];
    
    CSPartInfo *part2 = [[CSPartInfo alloc]init];
    part2.part = 2;
    part2.color = [UIColor greenColor];
    
    CSPartInfo *part3 = [[CSPartInfo alloc]init];
    part3.part = 2;
    part3.color = [UIColor blueColor];
    
    self.slider.partInfoArray = [NSArray arrayWithObjects:part1,part2,part3,nil];
    //[self.view addSubview:self.slider];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
