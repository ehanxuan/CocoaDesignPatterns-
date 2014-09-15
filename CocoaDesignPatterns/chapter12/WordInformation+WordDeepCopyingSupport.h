//
//  WordInformation+WordDeepCopyingSupport.h
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/10.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "WordInformation.h"

@interface WordInformation (WordDeepCopyingSupport)

- (id)deepCopy;

@end
