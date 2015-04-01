//
//  ViewController.m
//  UIUtils
//
//  Created by Andrew Lim on 4/1/15.
//  Copyright (c) 2015 Andrew Lim. All rights reserved.
//

#import "ViewController.h"
#import "UIUtils.h"

@interface ViewController ()
@property (nonatomic,retain) UIButton* button;
@property (nonatomic,retain) UILabel* label;
@property (nonatomic,retain) UITextField* textfield;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Button is at the top" forState:UIControlStateNormal];
    [self.button sizeToFit];
    [self.view addSubview:self.button];
    
    self.label = [[UILabel alloc] init];
    self.label.text = @"Label is in the middle";
    [self.label sizeToFit];
    [self.view addSubview:self.label];
    
    self.textfield = [[UITextField alloc] init];
    self.textfield.text = @"TextField is at the bottom";
    [self.textfield sizeToFit];
    self.textfield.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.textfield];
    
    // Stack views vertically
    [self.button setY:30];
    [self.label moveBelow:self.button by:4];
    [self.textfield moveBelow:self.label by:4];
    
    // Center views
    [self.button centerHorizontally];
    [self.label centerHorizontally];
    [self.textfield centerHorizontally];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
