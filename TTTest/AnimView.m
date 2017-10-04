//
//  AnimView.m
//  TTTest
//
//  Created by liang on 4/10/17.
//  Copyright © 2017年 tina. All rights reserved.
//

#import "AnimView.h"

@interface AnimView ()

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, strong) UIImage *image;

@end

@implementation AnimView

- (void)threadEntry:(id)obj {
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    while (!self.thread.isCancelled) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate date]];
    }
}

- (void)tick:(CADisplayLink *)displayLink {
    CGFloat offset = displayLink.timestamp / 1000000;
    CGPoint pos = self.layer.presentationLayer.position;
    pos.y -= offset;
    [CATransaction setDisableActions:YES];
    self.layer.position = pos;
    [CATransaction setDisableActions:NO];
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    CGFloat progress = 1 - (pos.y - self.to) / (self.from - self.to);
    
    CGRect rect = self.bounds;
    CGFloat height = CGRectGetHeight(rect);
    CGFloat deltaHeight = height / 2 * (0.5 - fabs(progress - 0.5));
    NSLog(@"delta:%f", deltaHeight);
    
    CGPoint topLeft = CGPointMake(0, deltaHeight);
    CGPoint topRight = CGPointMake(CGRectGetWidth(rect), deltaHeight);
    CGPoint bottomLeft = CGPointMake(0, height);
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(rect), height);
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    [[UIColor blueColor] setFill];
    [path moveToPoint:topLeft];
    [path addQuadCurveToPoint:topRight controlPoint:CGPointMake(CGRectGetMidX(rect), 0)];
    [path addLineToPoint:bottomRight];
    [path addQuadCurveToPoint:bottomLeft controlPoint:CGPointMake(CGRectGetMidX(rect), height - deltaHeight)];
    [path closePath];
    [path fill];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    // The interplay between views and layers usually results in the view replacing the contents of this property during a subsequent update.
    self.layer.contents = (__bridge id)self.image.CGImage;
    UIGraphicsEndImageContext();
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    CALayer *layer = self.layer.presentationLayer;
//    
//    CGFloat progress = 1 - (layer.position.y - self.to) / (self.from - self.to);
//    
//    CGFloat height = CGRectGetHeight(rect);
//    CGFloat deltaHeight = height / 2 * (0.5 - fabs(progress - 0.5));
//    NSLog(@"delta:%f", deltaHeight);
//    
//    CGPoint topLeft = CGPointMake(0, deltaHeight);
//    CGPoint topRight = CGPointMake(CGRectGetWidth(rect), deltaHeight);
//    CGPoint bottomLeft = CGPointMake(0, height);
//    CGPoint bottomRight = CGPointMake(CGRectGetWidth(rect), height);
//    
//    UIBezierPath* path = [UIBezierPath bezierPath];
//    [[UIColor blueColor] setFill];
//    [path moveToPoint:topLeft];
//    [path addQuadCurveToPoint:topRight controlPoint:CGPointMake(CGRectGetMidX(rect), 0)];
//    [path addLineToPoint:bottomRight];
//    [path addQuadCurveToPoint:bottomLeft controlPoint:CGPointMake(CGRectGetMidX(rect), height - deltaHeight)];
//    [path closePath];
//    [path fill];
//}

- (void)startAnim {
    self.from = self.layer.presentationLayer.position.y;
    self.to = self.layer.presentationLayer.position.y/3;
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadEntry:) object:nil];
    [self.thread start];
}

- (void)endAnim {
    [self.thread cancel];
}

@end
