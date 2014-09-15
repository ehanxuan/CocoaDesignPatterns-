//
//  NSUserDefaults+ColorHandling.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (ColorHandling)

- (void)setColor:(UIColor *)theColor forKey:(NSString *)key;
- (UIColor *)colorForKey:(NSString *)key;

@end
