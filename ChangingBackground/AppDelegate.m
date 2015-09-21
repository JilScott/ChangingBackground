//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate () {
    UIWindow *window;
}

@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIImageView *greenImageView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    self.navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [self.navigationController setNavigationBarHidden:YES];

    window.rootViewController = self.navigationController;
    self.navigationController.delegate = self;
    [self addBackgrounds];
    
    return YES;
}

- (void)addBackgrounds {
    [self.navigationController.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue"]]];
    
    self.greenImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    self.greenImageView.alpha = 0;
    [self.navigationController.view addSubview:self.greenImageView];
    [self.navigationController.view sendSubviewToBack:self.greenImageView];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([viewController isKindOfClass:[FirstViewController class]]) {
        [self animateTransitionToColor:@"blue"];
    } else {
        [self animateTransitionToColor:@"green"];
    }
    
}

- (void)animateTransitionToColor:(NSString *)color {
    if ([color isEqualToString:@"blue"]) {

    [UIView animateWithDuration:1.5f
                          delay:0.f
                        options:UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         //self.blueImageView.alpha = 1;
                            self.greenImageView.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    } else if ([color isEqualToString:@"green"]) {
        
        [UIView animateWithDuration:1.5f
                              delay:0.f
                            options:UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             // self.blueImageView.alpha = 0;
                             self.greenImageView.alpha = 1;
                         }
                         completion:^(BOOL finished) {
                             
                         }];
    }
}

@end
