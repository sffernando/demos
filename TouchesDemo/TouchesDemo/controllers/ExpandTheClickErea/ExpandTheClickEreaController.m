//
//  ExpandTheClickEreaController.m
//  TouchesDemo
//
//  Created by fernando on 2017/2/13.
//  Copyright © 2017年 fernando. All rights reserved.
//

#import "ExpandTheClickEreaController.h"
#import "BlueView.h"
#import <QuartzCore/QuartzCore.h>

@interface ExpandTheClickEreaController ()

@end

@implementation ExpandTheClickEreaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"扩大区域";
    self.view.backgroundColor = [UIColor whiteColor];
    
    BlueView *blueView = [[BlueView alloc] initWithFrame:CGRectMake(150, 300, 75, 75)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToTest:)];
    [blueView addGestureRecognizer:tap];
    [self.view addSubview:blueView];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectInset(blueView.frame, -20, -20)];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor grayColor].CGColor;
    [self.view.layer insertSublayer:shapeLayer below:blueView.layer];
    
}

- (void)tapToTest:(UITapGestureRecognizer *)tap {
    NSLog(@"点击了blueView");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
