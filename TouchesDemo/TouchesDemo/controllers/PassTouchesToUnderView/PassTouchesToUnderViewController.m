//
//  PassTouchesToUnderViewController.m
//  TouchesDemo
//
//  Created by fernando on 2017/2/13.
//  Copyright © 2017年 fernando. All rights reserved.
//

#import "PassTouchesToUnderViewController.h"
#import "GreenView.h"
#import "RedView.h"

@interface PassTouchesToUnderViewController () {
    GreenView *greenView ;
    RedView   *redView;
}

@end

@implementation PassTouchesToUnderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"将触摸事件传递给下面试图";
    self.view.backgroundColor = [UIColor whiteColor];
    
    greenView = [[GreenView alloc] initWithFrame:CGRectMake(150, 200, 75, 75)];
    [self.view addSubview:greenView];
    
    redView = [[RedView alloc] initWithFrame:CGRectMake(150, 350, 75, 75)];
    [self.view addSubview:redView];
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

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    if (CGRectContainsPoint(greenView.frame, [touch locationInView:self.view])) {
        NSLog(@"点了greenView");
    } else if (CGRectContainsPoint(redView.frame, [touch locationInView:self.view])) {
        NSLog(@"点了redView");
    } else {
        NSLog(@"点了白色背景view");
    }
    [super touchesEnded:touches withEvent:event];
}

@end
