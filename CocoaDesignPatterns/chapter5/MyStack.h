//
//  MyStack.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/05.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStack : NSObject

- (void)push:(id)anObject;
- (id)pop;
- (NSInteger)count;
- (id)peekAtIndex:(NSInteger)index;

@end
