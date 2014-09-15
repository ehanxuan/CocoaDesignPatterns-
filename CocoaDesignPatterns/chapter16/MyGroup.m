//
//  MyGroup.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/15.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyGroup.h"

@implementation MyGroup

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    children = [[NSMutableArray alloc] init];
    return self;
}

- (void)addChild:(MyGraphic *)aChild
{
    [children addObject:aChild];
}

- (NSArray *)children
{
    return [children copy];
}

- (CGRect)bounds
{
    if ([children count] == 0) {
        bounds = CGRectZero;
        
    } else {
        bounds = [[children objectAtIndex:0] bounds];
        for (MyGraphic *child in children) {
            bounds = CGRectUnion(bounds, [child bounds]);
        }
    }
    return bounds;
}

- (void)draw
{
    for (MyGraphic *child in children) {
        [child draw];
    }
}

@end
