//
//  MyShape.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/04.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyShape : NSObject
{
    CGRect frame;   // rectangle that encloses the shape
}

- (BOOL)doesContainPoint:(CGPoint)aPoint;

@end
