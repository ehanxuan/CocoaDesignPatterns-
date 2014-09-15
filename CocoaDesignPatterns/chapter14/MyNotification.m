//
//  MyNotification.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/11.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "MyNotification.h"

@interface MyNotification ()

@property (readwrite, copy) NSString *name;
@property (readwrite, assign) id object;
@property (readwrite, copy) NSDictionary *infoDictionary;

@end

@implementation MyNotification

- (id)initWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)someUserInfo
{
    [self setName:aName];
    [self setObject:anObject];
    [self setInfoDictionary:someUserInfo];
    
    return self;
}

@end
