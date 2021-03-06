//
//  AppDelegate.m
//  You Do It!
//
//  Created by Joe Dakroub on 9/6/13.
//  Copyright (c) 2014 Hand Whittled, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "Dropbox/Dropbox.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    DBAccountManager *accountManager = [[DBAccountManager alloc] initWithAppKey:[bundle objectForInfoDictionaryKey:@"APP_KEY"]
                                                                         secret:[bundle objectForInfoDictionaryKey:@"APP_SECRET"]];
    [DBAccountManager setSharedManager:accountManager];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [DBAccountManager.sharedManager handleOpenURL:url];
    
    return YES;
}

@end
