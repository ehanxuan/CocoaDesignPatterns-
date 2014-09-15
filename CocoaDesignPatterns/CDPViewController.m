//
//  CDPViewController.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/04.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "CDPViewController.h"
#import "CDPSecondViewController.h"

#import "WordInformation.h"
#import "WordInformation+WordDeepCopyingSupport.h"
#import "WordMutableInformation.h"

#import "MyGameHighScoreManager.h"

NSString *MyChapter14Notification = @"MyChapter14Notification";

@interface CDPViewController ()

@end

@implementation CDPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self testChapter11];
    [self testChapter14RegisterNotification];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self testChapter13AllocSharedInstance];
    [self testChapter14PostNotification];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    [self testChapter13DeallocSharedInstance];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)toNext:(id)sender
{
    CDPSecondViewController *nextPage = [[CDPSecondViewController alloc] init];
    [self.navigationController pushViewController:nextPage animated:YES];
}

#pragma mark - test for ch11
- (void)testChapter11
{
//    WordInformation *wordInformation = [[WordInformation alloc] initWithWord:@"word" clue:@"clue"];
    
    WordMutableInformation *wordMutableInformation = [[WordMutableInformation alloc] initWithWord:@"wordM" clue:@"clueM"];
    
    NSLog(@"mutable Information:\noriginal-%@\ncopy object-%@", wordMutableInformation, [wordMutableInformation copy]);
    NSLog(@"mutable Information:\noriginal-%@\ndeep copy object-%@", wordMutableInformation, [wordMutableInformation deepCopy]);
    NSLog(@"mutable Information:\noriginal-%@\nmutable copy object-%@", wordMutableInformation, [wordMutableInformation mutableCopy]);
    
    NSMutableString *mutableString = [NSMutableString stringWithString:@"test mutable string"];
    
    NSLog(@"mutable Information:\noriginal-%@\ncopy object-%@", mutableString, [[mutableString copy] class]);
    NSLog(@"mutable Information:\noriginal-%@\nmutable copy object-%@", mutableString, [[mutableString mutableCopy] class]);
    
}

#pragma mark - test for ch13
- (void)testChapter13AllocSharedInstance
{
    [MyGameHighScoreManager sharedInstance];
}

- (void)testChapter13DeallocSharedInstance
{
    if ([MyGameHighScoreManager sharedInstanceExists]) {
        [MyGameHighScoreManager attemptDealloc];
    }
}

#pragma mark - test for ch14
- (void)testChapter14RegisterNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(chapter14NotificationHandler:)
                                                 name:MyChapter14Notification
                                               object:@"aaa"];
}

- (void)testChapter14PostNotification
{
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, @"will post notification");
    [[NSNotificationCenter defaultCenter] postNotificationName:MyChapter14Notification object:@"aaa"];
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, @"did post notification");
}

- (void)chapter14NotificationHandler:(NSNotification *)notification
{
    [self performSelector:@selector(chapter14NotificationDelayHandler:) withObject:[notification object] afterDelay:0.0f];
//    NSLog(@"%s: %@", __PRETTY_FUNCTION__, [notification object]);
//    for (int i = 0; i < 5; i++) {
//        NSLog(@"%s: %d", __PRETTY_FUNCTION__, i+1);
//        for (int j = 0; j < 1000; j++) {
//            ;
//        }
//    }
}

- (void)chapter14NotificationDelayHandler:(id)object
{
    // ...
    NSLog(@"%s: %@", __PRETTY_FUNCTION__, object);
    for (int i = 0; i < 5; i++) {
        NSLog(@"%s: %d", __PRETTY_FUNCTION__, i+1);
        for (int j = 0; j < 1000; j++) {
            ;
        }
    }
}

@end
