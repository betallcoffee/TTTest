//
//  AnimView.h
//  TTTest
//
//  Created by liang on 4/10/17.
//  Copyright © 2017年 tina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimView : UIView

@property (nonatomic, assign) CGFloat from;
@property (nonatomic, assign) CGFloat to;

- (void)startAnim;
- (void)endAnim;

@end
