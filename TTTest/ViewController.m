//
//  ViewController.m
//  TTTest
//
//  Created by liang on 3/18/15.
//  Copyright (c) 2015 tina. All rights reserved.
//

#import <Masonry.h>

#import "ViewController.h"
#import "BViewController.h"
#import "CustomView.h"
#import "AnimView.h"

typedef void(^blk_t)(void);

@interface ViewController ()

@property (nonatomic, strong) AnimView *animView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad A");
    
    int j = 1;
    int *i = &j;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        *i = 2;
        [array addObject:@"liangliang"];
    });
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"block %d", *i);
        NSLog(@"BLOCK %@", array);
    });
    
    
    CustomView *customView = [[CustomView alloc] init];
    customView.frame = self.view.bounds;
    [self.view addSubview:customView];
    
    self.animView = [AnimView new];
    self.animView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animView];
    [self.animView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.animView.superview);
        make.width.height.mas_equalTo(44);
    }];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 88, 44)];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(pushB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
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
//    BViewController *b = [[BViewController alloc] init];
//    [self.navigationController pushViewController:b animated:YES];
//    [self presentViewController:b animated:YES completion:nil];
    [self.animView startAnim];
}

@end
