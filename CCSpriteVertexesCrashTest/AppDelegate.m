//
//  AppDelegate.m
//  CCSpriteVertexesCrashTest
//
//  Created by Thayer J Andrews on 4/30/15.
//  Copyright (c) 2015 Thayer J Andrews. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTestClass.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"Application did finish launching.");
    
    MyTestClass *mtc = [[MyTestClass alloc] init];

#if TEST_WITH_MOCK_CC_STRUCTS
    CCSpriteVertexes broken = CCSpriteVertexesInit();

#if TEST_WITH_DIRECT_METHOD_CALLS
    NSLog(@"Starting the test cases using method calls.");
    
    NSLog(@"Executing a broken assignment.");
    [mtc setVerts:broken];
    NSLog(@"Completed the broken assignment.");
    
    NSLog(@"We made it past the error case! Huzzah!");
#else
    NSLog(@"Starting the test cases using property assignment.");
    
    NSLog(@"Executing a broken assignment.");
    mtc.verts = broken;
    NSLog(@"Completed the broken assignment.");
    
    NSLog(@"We made it past the error case! Huzzah!");
#endif
#else
    WorkingStruct1 working1 = WorkingStruct1Init();
    WorkingStruct2 working2 = WorkingStruct2Init();
    BrokenStruct broken = BrokenStructInit();
    
    NSLog(@"Your working structure (1) is %lu bytes large.", sizeof(working1));
    NSLog(@"Your working structure (2) is %lu bytes large.", sizeof(working2));
    NSLog(@"Your broken structure is %lu bytes large.", sizeof(broken));
    
#if TEST_WITH_DIRECT_METHOD_CALLS
    NSLog(@"Starting the test cases using method calls.");

    NSLog(@"Executing a working assignment (1).");
    [mtc setWorking1:working1];
    NSLog(@"Completed the working assignment (1).");
    
    NSLog(@"Executing a working assignment (2).");
    [mtc setWorking2:working2];
    NSLog(@"Completed the working assignment (2).");
    
    NSLog(@"Executing a broken assignment.");
    [mtc setBroken:broken];
    NSLog(@"Completed the broken assignment.");
    
    NSLog(@"We made it past the error case! Huzzah!");
#else
    NSLog(@"Starting the test cases using property assignment.");

    NSLog(@"Executing a working assignment (1).");
    mtc.working1 = working1;
    NSLog(@"Completed the working assignment (1).");

    NSLog(@"Executing a working assignment (2).");
    mtc.working2 = working2;
    NSLog(@"Completed the working assignment (2).");

    NSLog(@"Executing a broken assignment.");
    mtc.broken = broken;
    NSLog(@"Completed the broken assignment.");
    
    NSLog(@"We made it past the error case! Huzzah!");
#endif
#endif
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
