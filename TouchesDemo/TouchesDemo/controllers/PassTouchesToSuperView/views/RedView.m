//
//  RedView.m
//  TouchesDemo
//
//  Created by fernando on 2017/2/12.
//  Copyright © 2017年 fernando. All rights reserved.
//

#import "RedView.h"

@implementation RedView

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
    self.backgroundColor = [UIColor redColor];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return self;
}

@end
