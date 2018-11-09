//
//  PushedViewController.m
//  WKWebViewInNavControllerTest
//
//  Created by Travis Johnson on 11/8/18.
//  Copyright © 2018 Summit ESP. All rights reserved.
//

#import "PushedViewController.h"

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    config.websiteDataStore = [WKWebsiteDataStore defaultDataStore];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) configuration:config];
    [self.view addSubview:self.webView];
    
    [self setupAutoLayout];
    [self loadURL:[NSURL URLWithString:@"https://www.google.com"]];
}

- (void)setupAutoLayout
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.webView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view removeConstraints: self.view.constraints];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]"
                                                                       options:NSLayoutFormatAlignAllCenterX | NSLayoutAttributeTop
                                                                       metrics:@{@"width": @(UIScreen.mainScreen.bounds.size.width)}
                                                                         views:@{@"view": self.view,}]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]"
                                                                       options:0
                                                                       metrics:@{@"height": @(UIScreen.mainScreen.bounds.size.height)}
                                                                         views:@{@"view": self.view,}]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[webView]-|"
                                                                       options:0
                                                                       metrics:@{}
                                                                         views:@{@"webView": self.webView}]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[webView]-|"
                                                                       options:0
                                                                       metrics:@{}
                                                                         views:@{@"webView": self.webView}]];
    [self.view layoutIfNeeded];
}

- (void)loadURL:(NSURL*)url
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

@end
