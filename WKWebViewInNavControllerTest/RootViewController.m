//
//  RootViewController.m
//  WKWebViewInNavControllerTest
//
//  Created by Travis Johnson on 11/8/18.
//  Copyright © 2018 Summit ESP. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "PushedViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.spawnSubViewButton = [UIButton new];
    self.spawnSubViewButton.backgroundColor = [UIColor colorWithRed:0.80 green:0.00 blue:0.00 alpha:1.0];
    [self.spawnSubViewButton setTitle:@"Push ViewController" forState:UIControlStateNormal];
    [self.spawnSubViewButton addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.spawnSubViewButton];
    
    [self setupAutoLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    APP_DELEGATE.rootNavigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    APP_DELEGATE.rootNavigationController.navigationBarHidden = NO;
}

- (void)setupAutoLayout
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.spawnSubViewButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view removeConstraints: self.view.constraints];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]"
                                                                       options:NSLayoutFormatAlignAllCenterX | NSLayoutAttributeTop
                                                                       metrics:@{@"width": @(UIScreen.mainScreen.bounds.size.width)}
                                                                         views:@{@"view": self.view,}]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]"
                                                                       options:0
                                                                       metrics:@{@"height": @(UIScreen.mainScreen.bounds.size.height)}
                                                                         views:@{@"view": self.view,}]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(50)-[spawnSubViewButton]-(50)-|"
                                                                       options:0
                                                                       metrics:@{}
                                                                         views:@{@"spawnSubViewButton": self.spawnSubViewButton}]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(89)-[spawnSubViewButton]-(89)-|"
                                                                       options:0
                                                                       metrics:@{}
                                                                         views:@{@"spawnSubViewButton": self.spawnSubViewButton}]];
    [self.view layoutIfNeeded];
}

- (void)pushViewController:(id)sender
{
    PushedViewController *pushedViewController = [PushedViewController new];
    [APP_DELEGATE.rootNavigationController pushViewController:pushedViewController animated:YES];
}

@end
