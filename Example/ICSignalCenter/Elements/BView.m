//
//  BView.m
//  ICSignal
//
//  Created by _ivanC on 7/2/16.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import "BView.h"
#import <ICSignalCenter/ICSignalCenter.h>

@interface BView ()

@property (strong, nonatomic) NSTimer *repeatTimer;

@property (strong, nonatomic) UILabel *displayLabel;

@end

@implementation BView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.displayLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.displayLabel.font = [UIFont boldSystemFontOfSize:18];
        self.displayLabel.textColor = [UIColor whiteColor];
        self.displayLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.displayLabel];
        
        self.repeatTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timerCallback) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)timerCallback
{
    extern NSString *const AVIEW_CENTER_SIGNAL;
    [[ICSignalCenter defaultCenter] postSignal:AVIEW_CENTER_SIGNAL withInfo:nil responseBlock:^(id object, NSDictionary *response) {
        
        self.displayLabel.text = [NSString stringWithFormat:@"AView center = %@", response[@"center"]];
    }];
    
}
@end
