//
//  MyGraphic.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/15.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyGraphic : NSObject
{
    CGRect bounds;
}

- (CGRect)bounds;
- (void)draw;

@end
