//
//  PushedViewController.h
//  WKWebViewInNavControllerTest
//
//  Created by Travis Johnson on 11/8/18.
//  Copyright © 2018 Summit ESP. All rights reserved.
//

#import <UIKit/UIKit.h>
@import WebKit;

NS_ASSUME_NONNULL_BEGIN

@interface PushedViewController : UIViewController

@property (strong, nonatomic, nonnull) WKWebView *webView;

@end

NS_ASSUME_NONNULL_END
