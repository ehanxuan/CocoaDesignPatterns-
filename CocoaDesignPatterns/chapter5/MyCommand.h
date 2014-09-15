//
//  MyCommand.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/05.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCommandProtocol.h"

@class MyStack;

typedef enum {
    MySuccess = 0,
    MyError = 1,
    MyHaltExcution = 2
} MyCommandReturn;

@interface MyCommand : NSObject<MyCommandProtocol>

+ (MyCommandReturn)executeWithStack:(MyStack *)stack;

@end
