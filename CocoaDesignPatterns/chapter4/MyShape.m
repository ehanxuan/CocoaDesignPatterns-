//
//  MyShape.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/04.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyShape.h"

@implementation MyShape

- (BOOL)doesContainPoint:(CGPoint)aPoint
{
    if (aPoint.x <= CGRectGetMinX(frame) || aPoint.x >= CGRectGetMaxX(frame)) {
        return NO;
    }
    if (aPoint.y <= CGRectGetMinY(frame) || aPoint.y >= CGRectGetMaxY(frame)) {
        return NO;
    }
    return YES;
}

@end
