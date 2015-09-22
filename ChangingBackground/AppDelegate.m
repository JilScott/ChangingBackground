//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "UIColor+UIColor_ChangingBackgrounds.h"

@interface AppDelegate () {
    UIWindow *window;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];
    [navigationController.view setBackgroundColor:[UIColor blueImage]];

    window.rootViewController = navigationController;
    
    return YES;
}

@end
