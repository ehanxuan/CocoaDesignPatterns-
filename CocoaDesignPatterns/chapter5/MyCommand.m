//
//  MyCommand.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/05.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyCommand.h"

@implementation MyCommand

+ (MyCommandReturn)executeWithStack:(MyStack *)stack
{
    NSLog(@"%@: not implemented yet.\n", NSStringFromClass(self));
    return MyError;
}

@end
