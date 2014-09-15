//
//  MyGameHighScoreManager.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyGameHighScoreManager.h"

//@interface MyGameHighScoreManager ()
//
//@property (nonatomic, strong) static MyGameHighScoreManager *myInstance;
//
//@end

static MyGameHighScoreManager *myInstance = nil;

@implementation MyGameHighScoreManager

+ (id)hiddenAlloc
{
//    return [super alloc];     // 默认会调用 +allocWithZone: 方法，于是会返回 nil
    return [super allocWithZone:nil];
}

+ (id)alloc
{
    NSLog(@"%@: use +sharedInstance instead of +alloc", NSStringFromClass([self class]));
    // 或者，这里也可以抛出一个异常
    return nil;
}

+ (id)new
{
    return [self alloc];
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [self alloc];
}

- (id)copyWithZone:(NSZone *)zone
{
    NSLog(@"%@: attempt to -copy may be a bug.", NSStringFromClass([self class]));
//    [self retain];
    return self;
}

- (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self copyWithZone:zone];
}

+ (MyGameHighScoreManager *)sharedInstance
{
    if (!myInstance) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        myInstance = [[[self class] hiddenAlloc] init];
    }
    return myInstance;
}

+ (BOOL)sharedInstanceExists
{
    return (myInstance != nil);
}

+ (void)attemptDealloc
{
    if (myInstance) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        myInstance = nil;
    }
}

@end
