//
//  RedView.m
//  TouchesDemo
//
//  Created by fernando on 2017/2/12.
//  Copyright © 2017年 fernando. All rights reserved.
//

#import "RedView.h"
#import "TextViewController.h"

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

-(UIViewController*)parentController{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self parentController]) {
        NSLog(@"%@",NSStringFromClass([[self parentController] class]));
        if ([self parentController].navigationController) {
            TextViewController *tc = [[TextViewController alloc] init];
            [[self parentController].navigationController pushViewController:tc animated:YES];
        }
    }
    [super touchesEnded:touches withEvent:event];
}

@end
