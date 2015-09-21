//
//  AnimationObject.m
//  ChangingBackground
//
//  Created by Jilian Scott on 9/21/15.
//  Copyright (c) 2015 Ora Interactive. All rights reserved.
//

#import "AnimationObject.h"

@implementation AnimationObject


- (instancetype)init
{
    return [self initWithDuration:0.5 options:0];
}

- (instancetype)initWithDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options
{
    self = [super init];
    if (self) {
        _duration = duration;
        _options = options;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [toViewController.view layoutIfNeeded];
    
    BOOL optionsContainShowHideTransitionViews = (self.options & UIViewAnimationOptionShowHideTransitionViews) != 0;
    if (!optionsContainShowHideTransitionViews) {
        [[transitionContext containerView] addSubview:toViewController.view];
    }
    
    [UIView transitionFromView:fromViewController.view
                        toView:toViewController.view
                      duration:self.duration
                       options:self.options | UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        if (!optionsContainShowHideTransitionViews) {
                            [fromViewController.view removeFromSuperview];
                        }
                        
                        [transitionContext completeTransition:YES];
                    }];
}

@end
