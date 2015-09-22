//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AnimationObject.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void)viewDidLoad {
    self.navigationController.delegate = self;
    //self.navigationController.view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue"]];
}

- (id<UIViewControllerAnimatedTransitioning>)
            navigationController:(UINavigationController *)navigationController
 animationControllerForOperation:(UINavigationControllerOperation)operation
              fromViewController:(UIViewController *)fromVC
                toViewController:(UIViewController *)toVC {
    
    AnimationObject *animationController = [[AnimationObject alloc] init];
    return animationController;
}

@end
