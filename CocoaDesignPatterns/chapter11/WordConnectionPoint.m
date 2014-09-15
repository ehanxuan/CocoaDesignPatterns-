//
//  WordConnectionPoint.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "WordConnectionPoint.h"

static NSString *CodingKeyFrame = @"frame";
static NSString *CodingKeyColor = @"color";
static NSString *CodingKeyIsFilled = @"isFilled";
static NSString *CodingKeyLineWidth = @"lineWidth";
static NSString *CodingKeyAssociatedWordInformation = @"associatedWordInformation";

id MYDeepCopyObject(id <NSCoding> anObject)
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:anObject]];
}

@implementation WordConnectionPoint

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        [self setFrame:[aDecoder decodeCGRectForKey:CodingKeyFrame]];
        [self setColor:[aDecoder decodeObjectForKey:CodingKeyColor]];
        [self setIsFilled:[aDecoder decodeBoolForKey:CodingKeyColor]];
        [self setLineWidth:[aDecoder decodeFloatForKey:CodingKeyLineWidth]];
        [self setAssociatedWordInformation:[aDecoder decodeObjectForKey:CodingKeyAssociatedWordInformation]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeCGRect:self.frame forKey:CodingKeyFrame];
    [aCoder encodeObject:self.color forKey:CodingKeyColor];
    [aCoder encodeBool:self.isFilled forKey:CodingKeyIsFilled];
    [aCoder encodeFloat:self.lineWidth forKey:CodingKeyLineWidth];
    [aCoder encodeObject:self.associatedWordInformation forKey:CodingKeyAssociatedWordInformation];
}

@end
