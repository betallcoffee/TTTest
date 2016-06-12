//
//  CustomView.m
//  TTTest
//
//  Created by liang on 9/4/15.
//  Copyright (c) 2015 tina. All rights reserved.
//

#import <Masonry.h>
#import "CustomView.h"

@interface CustomView ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation CustomView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self mas_drawView];
    }
    return self;
}

- (void)mas_drawView {
    [self addSubview:self.leftLabel];
    self.leftLabel.text = @"leftLabel";

    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        __weak UIView *superview = self.leftLabel.superview;
        make.edges.equalTo(superview);
    }];
}

- (void)drawView {
    self.clipsToBounds = YES;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.leftLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.rightLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:self.leftLabel];
    [self.leftLabel contentHuggingPriorityForAxis:UILayoutConstraintAxisHorizontal];
    self.leftLabel.text = @"leftLabel";
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.leftLabel
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1 constant:5];
    [self addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.leftLabel
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1 constant:5];
    [self addConstraint:constraint];
    
    [self addSubview:self.rightLabel];
    self.rightLabel.numberOfLines = 0;
    self.rightLabel.preferredMaxLayoutWidth = 200;
    self.rightLabel.text = @"rightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabelrightLabel";
    constraint = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeTop
                                             multiplier:1 constant:5];
    [self addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                              attribute:NSLayoutAttributeRight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1 constant:-5];
    [self addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeLeft
                                             multiplier:1 constant:-5];
    [self addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                              attribute:NSLayoutAttributeLeft
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.leftLabel
                                              attribute:NSLayoutAttributeRight
                                             multiplier:1 constant:5];
    [self addConstraint:constraint];
    constraint = [NSLayoutConstraint constraintWithItem:self.rightLabel
                                              attribute:NSLayoutAttributeBottom
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self
                                              attribute:NSLayoutAttributeBottom
                                             multiplier:1 constant:-5];
    [self addConstraint:constraint];

    CGSize size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"size: %@", CGSizeCreateDictionaryRepresentation(size));
}

#pragma mark getter/setter
- (UILabel *)leftLabel {
    if (_leftLabel == nil) {
        _leftLabel = [[UILabel alloc] init];
    }
    return  _leftLabel;
}

- (UILabel *)rightLabel {
    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] init];
    }
    return _rightLabel;
}

@end
