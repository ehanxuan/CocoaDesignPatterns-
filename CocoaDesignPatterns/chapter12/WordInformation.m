//
//  WordInformation.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "WordInformation.h"

@interface WordInformation ()

@property (nonatomic, strong, readwrite) NSString *word;
@property (nonatomic, strong, readwrite) NSString *clue;
@property (nonatomic, strong, readwrite) NSMutableDictionary *puzzleSpecificAttributes;

@end

static NSString *CodingKeyWord = @"word";
static NSString *CodingKeyClue = @"clue";
static NSString *CodingKeyPuzzleSpecificAttributes = @"puzzleSpecificAttributes";

@implementation WordInformation

- (id)initWithWord:(NSString *)aWord clue:(NSString *)aClue
{
    self = [super init];
    if (self) {
        self.word = aWord;
        self.clue = aClue;
    }
    return self;
}

- (id)init
{
    return [self initWithWord:@"" clue:@""];
}

- (NSString *)toString
{
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendString:self.word];
    [str appendString:self.clue];
    return [NSString stringWithString:str];
}

#pragma mark - NSCoding protocol
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setWord:[aDecoder decodeObjectForKey:CodingKeyWord]];
        [self setClue:[aDecoder decodeObjectForKey:CodingKeyClue]];
        [self setPuzzleSpecificAttributes:[aDecoder decodeObjectForKey:CodingKeyPuzzleSpecificAttributes]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.word forKey:CodingKeyWord];
    [aCoder encodeObject:self.clue forKey:CodingKeyClue];
    [aCoder encodeObject:self.puzzleSpecificAttributes forKey:CodingKeyPuzzleSpecificAttributes];
}

#pragma mark - NSCopying protocol
- (id)copyWithZone:(NSZone *)zone
{
    return [self copy];
}

#pragma mark - NSMutableCopying protocol
- (id)mutableCopyWithZone:(NSZone *)zone
{
    id result = [[[self class] allocWithZone:zone] initWithWord:self.word clue:self.clue];
    [[result puzzleSpecificAttributes] addEntriesFromDictionary:self.puzzleSpecificAttributes];
    return result;
}

@end
