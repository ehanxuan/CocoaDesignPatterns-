//
//  NSUserDefaults+ColorHandling.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "NSUserDefaults+ColorHandling.h"

@implementation NSUserDefaults (ColorHandling)

- (void)setColor:(UIColor *)theColor forKey:(NSString *)key
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:theColor];
    [self setObject:data forKey:key];
}

- (UIColor *)colorForKey:(NSString *)key
{
    NSData *data = [self dataForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
