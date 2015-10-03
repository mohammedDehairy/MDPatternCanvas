//
//  ViewController.m
//  MDPatternCanvas-Demo
//
//  Created by mohamed mohamed El Dehairy on 10/3/15.
//  Copyright © 2015 mohamed mohamed El Dehairy. All rights reserved.
//

#import "ViewController.h"
#import "MDPatternCanvas.h"
#import "MDTrianglePatternLayout.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MDPatternCanvas *trianglePattern = [[MDPatternCanvas alloc] initWithFrame:CGRectMake(10, 30, self.view.frame.size.width-20, self.view.frame.size.width-20) patternLayout:[[MDTrianglePatternLayout alloc] init]];
    [self.view addSubview:trianglePattern];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
