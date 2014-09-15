//
//  WordConnectionPoint.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WordInformation;

@interface WordConnectionPoint : NSObject <NSCoding>

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) BOOL isFilled;
@property (nonatomic, assign) float lineWidth;
@property (nonatomic, strong) WordInformation *associatedWordInformation;

@end
