//
//  AppDelegate.h
//  WKWebViewInNavControllerTest
//
//  Created by Travis Johnson on 11/8/18.
//  Copyright © 2018 Summit ESP. All rights reserved.
//

#import <UIKit/UIKit.h>

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic, nonnull) UINavigationController *rootNavigationController;

@end
