//
//  MyNotification.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/11.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyNotification : NSObject

@property (readonly, copy) NSString *name;
@property (readonly, assign) id object;
@property (readonly, copy) NSDictionary *infoDictionary;

- (id)initWithName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)someUserInfo;

@end
