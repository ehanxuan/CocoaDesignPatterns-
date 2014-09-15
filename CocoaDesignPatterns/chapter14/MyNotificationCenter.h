//
//  MyNotificationCenter.h
//  CocoaDesignPatterns
//
// 在许多方面，MyNotificationCenter 类都复制了 NSNotificationCenter 的能力。
// 不过，在使用 Cocoa 的 NSNotificationCenter 时，如果 -addObserver:selector:name:object 方法的
// name 参数是 nil，那么就把观察者注册成接收与指定的 object 参数关联的所有通知。
// MyNotificationCenter 不允许利用 nil 通知名称进行注册。
//
//  Created by ehanxuan on 2014/09/11.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyNotification.h"

@interface MyNotificationCenter : NSObject

+ (id)defaultCenter;

/**
 * 注册观察者
 * notificationObserver: 观察者
 * notificationSelector: 选择器
 * notificationName: 通知名称。只有其名称与指定名称匹配的通知才会被传送给注册的观察者
 * objectOfInterest: 观察者感兴趣的对象。只有其对象与指定对象匹配的通知才会被传送给注册的观察者
 *                   如果指定为 nil，那么无论通知对象是什么，都会传送与指定名称匹配的所有通知（Cocoa 的 NSNotificationCenter 可能没有这个功能）
 */
- (void)addObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(id)objectOfInterest;

- (void)removeObserver:(id)notificationObserver;
- (void)postNotification:(MyNotification *)aNotification;
- (void)postNotificationName:(NSString *)aName object:(id)objectOfInterest userInfo:(NSDictionary *)someUserInfo;

@end

/**
 * MyNotificationCenter 间接存储 _MyNotificationObserverRecord。
 * MyNotificationCenter 的 observersDictionary 是输入通知名称中的可变数组的可变字典，
 * 并且第个数组都存储 _MyNotificationObserverRecord 实例。
 **/
@interface _MyNotificationObserverRecord : NSObject

@property (readwrite, assign) id object;
@property (readwrite, assign) id observer;
@property (readwrite, assign) SEL selector;

@end
