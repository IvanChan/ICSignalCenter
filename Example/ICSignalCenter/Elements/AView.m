//
//  AView.m
//  ICSignal
//
//  Created by _ivanC on 7/2/16.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import "AView.h"
#import <ICSignalCenter/ICSignalCenter.h>

NSString *const AVIEW_CENTER_SIGNAL = @"AVIEW_CENTER_SIGNAL";

@interface AView ()

@property (assign, nonatomic) BOOL isBackward;

@property (strong, nonatomic) NSTimer *repeatTimer;

@end

@implementation AView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [[ICSignalCenter defaultCenter] registerSignalHandler:self forSignal:AVIEW_CENTER_SIGNAL handleBlock:^NSDictionary *(NSDictionary *signalInfo) {
            
            return @{@"center":[NSValue valueWithCGPoint:self.center]};
        }];
    }
    
    return self;
}

- (void)startMoving
{
    self.repeatTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
}

- (void)timerCallback
{
    CGPoint center = self.center;
    center.x += (self.isBackward ? -1 : 1);
    self.center = center;
    
    if (self.center.x > 300)
    {
        self.isBackward = YES;
    }
    else if (self.center.x < 10)
    {
        self.isBackward = NO;
    }
}

@end
