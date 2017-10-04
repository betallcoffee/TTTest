//
//  CustomView.h
//  TTTest
//
//  Created by liang on 9/4/15.
//  Copyright (c) 2015 tina. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TestProtocol.h"

@interface CustomView : UIView<TestProtocol>

@property (copy) NSMutableArray *array;

@end
