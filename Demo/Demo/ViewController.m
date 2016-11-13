//
//  ViewController.m
//  Demo
//
//  Created by _ivanC on 12/11/2016.
//  Copyright © 2016 _ivanC. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
#import "BView.h"

@interface ViewController ()

@property (strong, nonatomic) AView *aView;
@property (strong, nonatomic) BView *bView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.aView = [[AView alloc] initWithFrame:CGRectMake(0, 130, 40, 130)];
    self.aView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.aView];
    
    self.bView = [[BView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.bounds) - 100, CGRectGetWidth(self.view.bounds), 100)];
    self.bView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.bView];
    
    [self.aView startMoving];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
