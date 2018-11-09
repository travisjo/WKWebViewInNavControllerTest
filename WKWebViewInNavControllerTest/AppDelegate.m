//
//  AppDelegate.m
//  WKWebViewInNavControllerTest
//
//  Created by Travis Johnson on 11/8/18.
//  Copyright © 2018 Summit ESP. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    RootViewController *rootViewController = [RootViewController new];
    self.rootNavigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    self.window.rootViewController = self.rootNavigationController;
    
    return YES;
}

@end
