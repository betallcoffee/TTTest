//
//  TestGCD.m
//  TTTest
//
//  Created by liang on 28/9/17.
//  Copyright © 2017年 tina. All rights reserved.
//

#import "TestGCD.h"

@interface TestGCD ()
{
    dispatch_queue_t _gcdQueue;
    dispatch_group_t _gcdGroup;
    id _observer;
}

@end

@implementation TestGCD

- (instancetype)init {
    self = [super init];
    if (self) {
        _gcdQueue = dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0);
        _gcdGroup = dispatch_group_create();
    }
    return self;
}

- (void)dealloc {
    NSLog(@"TestGCD dealloc");
}

- (void)doSomething {
    NSLog(@"TestGCD do something");
}

- (void)testCycleRef {
//    __weak typeof(self) weakSelf = self;
//    dispatch_async(_gcdQueue, ^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;
//        [strongSelf doSomething];
//    });
    
//    _observer =
    [[NSNotificationCenter defaultCenter] addObserverForName:@"testKey"
                                                      object:self
                                                       queue:nil
                                                  usingBlock:^(NSNotification *note) {
                                                      [self doSomething];
//                                                      [[NSNotificationCenter defaultCenter] removeObserver:_observer];
//                                                      _observer = nil;
                                                  }];
    
//    dispatch_group_async(_gcdGroup, _gcdQueue, ^{
//        [self doSomething];
//    });
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doSomething) name:@"testKey" object:nil];
}

@end
