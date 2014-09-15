//
//  MyStack.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/05.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyStack.h"

@interface MyStack ()
{
    NSMutableArray *storage;
}

@end

@implementation MyStack

#pragma mark - Initializer
- (id)init
{
    self = [super init];
    if (self) {
        storage = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - public methods
- (void)push:(id)anObject
{
    if (anObject) {
        [storage addObject:anObject];
    }
}

- (id)pop
{
    id value = nil;
    if ([storage count] > 0) {
        value = [storage lastObject];
        [storage removeLastObject];
    }
    return value;
}

- (NSInteger)count
{
    return [storage count];
}

- (id)peekAtIndex:(NSInteger)index
{
    id value = nil;
    if (index < [self count]) {
        value = [storage objectAtIndex:([storage count] - 1) - index];
    }
    return value;
}

@end
