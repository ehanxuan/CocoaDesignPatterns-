//
//  CDPAppDelegate.m
//  CocoaDesignPatterns
//
//  Created by ehanxuan on 2014/09/04.
//  Copyright (c) 2014年 E HANXUAN. All rights reserved.
//

#import "CDPAppDelegate.h"
#import "MyStack.h"
#import "MyCommand.h"
#import "MyCommand+informal_protocol.h"

@implementation CDPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - test chapter5

static NSMutableDictionary *operators = nil;

#define MY_MAX_STRING 8192

- (void)testCapter5
{
    MyStack *stack = [[MyStack alloc] init];
    BOOL parsing = YES;
    char cString[MY_MAX_STRING];
    
    operators = [[NSMutableDictionary alloc] init];
    [operators setObject:@"add" forKey:@"+"];
    [operators setObject:@"subtract" forKey:@"-"];
    [operators setObject:@"multiply" forKey:@"*"];
    [operators setObject:@"divide" forKey:@"/"];
    
    while (parsing) {
        NSString *subString;
        
        fgets(cString, MY_MAX_STRING, stdin);
        NSString *inputLine = [NSString stringWithUTF8String:cString];
        NSArray *splitLine = [inputLine componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        for (subString in splitLine) {
            NSString *operator;
            NSString *commandName;
            Class commandClass;
            
            if (NSOrderedSame == [subString compare:@""]) {
                continue;
            }
            
            for (operator in operators) {
                if (NSOrderedSame == [operator compare:subString]) {
                    subString = [operators objectForKey:operator];
                    break;
                }
            }
            
            commandName = [NSString stringWithFormat:@"My%@Command", [subString capitalizedString]];
            commandClass = NSClassFromString(commandName);
            
            if (commandClass) {
                MyCommandReturn result = [commandClass executeWithStack:stack];
                switch (result) {
                    case MyHaltExcution:
                        parsing = NO;
                        break;
                        
                    case MyError:
                        NSLog(@"Error executing command \"%@\".", subString);
                        break;
                    
                    case MySuccess:
                        
                    default:
                        break;
                }
            } else {
                [stack push:subString];
            }
            MyCommand *command = [[MyCommand alloc] init];
//            [command testInformalProtocol];
            [command protocolMethod];
        }
    }
}

@end
