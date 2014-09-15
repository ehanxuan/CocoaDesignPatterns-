//
//  MyGroup.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/15.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyGraphic.h"

@interface MyGroup : MyGraphic
{
    NSMutableArray *children;
}

- (void)addChild:(MyGraphic *)aChild;
- (NSArray *)children;

/**
 * 疑问：
 * “按接口编程”的思想，会要求尽可能子类完全能被其父类替代，
 * 也就是说，子类不会有新加入的方法。这里新加的两个方法如果
 * 放到其父类中，并为其提供默认方法，应该也是可以的吧。
 */

@end
