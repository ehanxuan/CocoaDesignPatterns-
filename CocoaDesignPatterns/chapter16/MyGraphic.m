//
//  MyGraphic.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/15.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyGraphic.h"

@implementation MyGraphic

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    bounds = CGRectMake(0.0, 0.0, 0.0, 0.0);
    return self;
}

- (CGRect)bounds
{
    return bounds;
}

- (void)draw
{
    // overridden by subclasses to do actual drawing
}

@end
