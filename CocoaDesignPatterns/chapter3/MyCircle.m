//
//  MyCircle.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/04.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyCircle.h"

@interface MyCircle ()
{
    CGPoint center;
    float radius;
}

@end

@implementation MyCircle

// Designated Initalizer （指定初始化方法）
- (id)initWithCenter:(CGPoint)aPoint radius:(float)aRadius
{
    self = [super init];    // ●将 self 分配至父类的指定初始化方法所返回的对象
                            // ●确保指定初始化方法调用其父类的指定初始化方法的实现
                            // ●子类化时，确保每个不是指定初始化方法的新初始化方法调用指定初始化方法。
    
    if (self != nil) {      // ●如果父类的指定初始化方法返回的值是 nil，不要访问实例变量
        center = aPoint;
        radius = aRadius;
    }
    return self;
}

/**
 * 第个引入新指定初始化方法的类也必须覆盖继承的指定初始化方法。
 * 由于引入了 -initWithCenter:radius: ，因此还必须实现 -init 来调用 -initWithCenter:radius: 。
 */
- (id)init                  // ●确保已覆盖父类的指定初始化方法，以便调用新的指定初始化方法
{
    static const float MYDefaultRadius = 1.0f;
    return [self initWithCenter:CGPointZero radius:MYDefaultRadius];
}

@end
