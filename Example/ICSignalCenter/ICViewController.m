//
//  ICViewController.m
//  ICSignalCenter
//
//  Created by aintivanc@icloud.com on 04/23/2017.
//  Copyright (c) 2017 aintivanc@icloud.com. All rights reserved.
//

#import "ICViewController.h"
#import "AView.h"
#import "BView.h"

@interface ICViewController ()

@property (strong, nonatomic) AView *aView;
@property (strong, nonatomic) BView *bView;

@end

@implementation ICViewController

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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
