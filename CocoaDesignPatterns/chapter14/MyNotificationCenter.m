//
//  MyNotificationCenter.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/11.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyNotificationCenter.h"

@interface MyNotificationCenter ()

@property (readwrite, strong) NSMutableDictionary *observersDictionary;

@end

@implementation _MyNotificationObserverRecord

@end

@implementation MyNotificationCenter

+ (id)defaultCenter
{
    static id sharedNotificationCenter = nil;
    
    if (!sharedNotificationCenter) {
        sharedNotificationCenter = [[MyNotificationCenter alloc] init];
    }
    
    return sharedNotificationCenter;
}

#pragma mark - Designated initializer
- (id)init
{
    self = [super init];
    if (self) {
        [self setObserversDictionary:[NSMutableDictionary dictionary]];
    }
    return self;
}

#pragma mark - Public Methods
- (void)addObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(id)objectOfInterest
{
    NSParameterAssert(notificationName);
    
    _MyNotificationObserverRecord *newRecord = [[_MyNotificationObserverRecord alloc] init];
    [newRecord setObject:objectOfInterest];
    [newRecord setObserver:notificationObserver];
    [newRecord setSelector:notificationSelector];
    
    NSMutableArray *observers = [self.observersDictionary objectForKey:notificationName];
    if (observers) {
        [observers addObject:newRecord];
    } else {
        [self.observersDictionary setObject:[NSMutableArray arrayWithObject:newRecord] forKey:notificationName];
    }
}

- (void)removeObserver:(id)notificationObserver
{
    if (notificationObserver) {
        _MyNotificationObserverRecord *currentObserverRecord;
        
        for (NSMutableArray *observers in self.observersDictionary) {
            NSInteger i;
            for (i = [observers count] - 1; i >= 0; i--) {
                currentObserverRecord = [observers objectAtIndex:i];
                if (notificationObserver == [currentObserverRecord observer]) {
                    [observers removeObjectAtIndex:i];
                }
            }
        }
    }
}

- (void)postNotification:(MyNotification *)aNotification
{
    NSParameterAssert(aNotification);
    NSAssert([aNotification name], @"nil notification name");
    
    NSArray *observers = [self.observersDictionary objectForKey:[aNotification name]];
    
    for (id currentObserverRecord in observers) {
        id object = [currentObserverRecord object];
        
        if (object == nil || object == [aNotification object]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [[currentObserverRecord observer] performSelector:[currentObserverRecord selector] withObject:aNotification];
#pragma clang diagnostic pop
        }
    }
}

- (void)postNotificationName:(NSString *)aName object:(id)objectOfInterest userInfo:(NSDictionary *)someUserInfo
{
    MyNotification *newNotification = [[MyNotification alloc] initWithName:aName object:objectOfInterest userInfo:someUserInfo];
    [self postNotification:newNotification];
}

@end