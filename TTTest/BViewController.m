//
//  BViewController.m
//  TTTest
//
//  Created by liang on 3/18/15.
//  Copyright (c) 2015 tina. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"viewDidLoad B");
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 88, 44)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWilAppear B");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"viewWillDisappear B");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"viewDidAppear B");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear B");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning B");
}

#pragma mark
#pragma mark UIButton touch event
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
