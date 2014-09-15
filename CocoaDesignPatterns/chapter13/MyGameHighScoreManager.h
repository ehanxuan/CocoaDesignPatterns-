//
//  MyGameHighScoreManager.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyGameHighScoreManager : NSObject

+ (id)sharedInstance;
+ (void)attemptDealloc;
+ (BOOL)sharedInstanceExists;
//- (void)registerScore:(NSNumber *)score playerName:(NSString *)name;
//- (NSEnumerator *)scoreEnumerator;

@end
