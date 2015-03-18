//
//  ViewController.m
//  TTTest
//
//  Created by liang on 3/18/15.
//  Copyright (c) 2015 tina. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad A");
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 88, 44)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(pushB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
    
    int j = 1;
    int *i = &j;
    dispatch_async(dispatch_get_main_queue(), ^{
        *i = 2;
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"block %d", *i);
    });
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWilAppear A");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear A");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear A");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear A");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning A");
}

#pragma mark
#pragma mark UIButton touch event
- (void)pushB {
    BViewController *b = [[BViewController alloc] init];
//    [self.navigationController pushViewController:b animated:YES];
    [self presentViewController:b animated:YES completion:nil];
}

@end
