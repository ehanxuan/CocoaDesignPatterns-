//
//  WordMutableInformation.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "WordMutableInformation.h"

@implementation WordMutableInformation

#pragma mark - NSCopying protocol
- (id)copyWithZone:(NSZone *)aZone
{
    id result = [[[self class] allocWithZone:aZone] initWithWord:self.word clue:self.clue];
    
    [[result puzzleSpecificAttributes] addEntriesFromDictionary:self.puzzleSpecificAttributes];
    
    return result;
}

@end
