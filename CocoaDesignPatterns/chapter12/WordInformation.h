//
//  WordInformation.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordInformation : NSObject <NSCoding, NSCopying, NSMutableCopying>

@property (nonatomic, strong, readonly) NSString *word;
@property (nonatomic, strong, readonly) NSString *clue;
@property (nonatomic, strong, readonly) NSMutableDictionary *puzzleSpecificAttributes;

- (id)initWithWord:(NSString *)aWord clue:(NSString *)aClue;

@end
