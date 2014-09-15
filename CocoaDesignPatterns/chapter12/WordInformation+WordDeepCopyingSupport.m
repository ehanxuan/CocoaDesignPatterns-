//
//  WordInformation+WordDeepCopyingSupport.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "WordInformation+WordDeepCopyingSupport.h"

@implementation WordInformation (WordDeepCopyingSupport)

- (id)deepCopy
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
}

@end
