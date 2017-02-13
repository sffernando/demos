//
//  BlueView.m
//  TouchesDemo
//
//  Created by fernando on 2017/2/12.
//  Copyright © 2017年 fernando. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeSetup];
    }
    return self;
}

- (void)initializeSetup {
    self.backgroundColor = [UIColor blueColor];
    self.clipsToBounds = NO;
}


// 自定义view
// 重写下面的两个方法
// 在controller中，蓝色view是self，灰色view是蓝色view下面的shapeLayer

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect touchRect = CGRectInset(self.bounds, -20, -20);
    return CGRectContainsPoint(touchRect, point);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled) {
        return nil;
    }
    
    if (self.hidden) {
        return nil;
    }
    
    if (self.alpha <= 0.01) {
        return nil;
    }
    
    CGRect touchRect = CGRectInset(self.bounds, -20, -20);
    if (CGRectContainsPoint(touchRect, point)) {
        if (CGRectContainsPoint(self.bounds, point)) {
            NSLog(@"点击了蓝色区域");
        } else {
            NSLog(@"点击了灰色区域");
        }
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        
        return self;
    }
    return nil;
}

@end
