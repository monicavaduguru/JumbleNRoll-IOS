//
//  AppDelegate.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "AppDelegate.h"
#import "Audio.h"
#import "BestTimes.h"
#import "Times.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    audio = [[AudioController alloc] init];
    [audio preloadAudioEffects: kAudioEffectFiles];
    
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"saved.plist"];
    NSError *error;
     [fileManager removeItemAtPath:filePath error:&error];
    //NSLog(success ? @"Yes" : @"No");
    //NSLog(@"%@",filePath);
    //printf("in app delegate");
    
    
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filename =
    [documentsDirectory
     stringByAppendingPathComponent:
     @"saved.plist"];
    [[NSFileManager defaultManager] fileExistsAtPath:filename];
    //NSLog(a ? @"Yes" : @"No");
    
    
    besttimes = [[BestTimes alloc] init];
    return YES;
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
     [besttimes savePersistentData];
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

@end
