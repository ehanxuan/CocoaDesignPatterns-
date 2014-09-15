//
//  MyCircleShape.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/04.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyCircleShape.h"

@implementation MyCircleShape

- (BOOL)doesContainPoint:(CGPoint)aPoint
{
    BOOL result = [super doesContainPoint:aPoint];
    
    if (result) {
        CGPoint center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
        float radius = MIN(CGRectGetWidth(frame) / 2.0f, CGRectGetHeight(frame) / 2.0f);
        float radiusSquared = radius * radius;
        float deltaX = aPoint.x - center.x;
        float deltaY = aPoint.y - center.y;
        float distanceSquared = (deltaX * deltaX) + (deltaY * deltaY);
        
        result = (distanceSquared <= radiusSquared);
    }
    return result;
}

@end
