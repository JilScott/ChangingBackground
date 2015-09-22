//
//  AnimationObject.m
//  ChangingBackground
//
//  Created by Jilian Scott on 9/21/15.
//  Copyright (c) 2015 Ora Interactive. All rights reserved.
//

#import "AnimationObject.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

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
    
    UIImage *greenImage = [UIImage imageNamed:@"green"];
    UIImage *blueImage = [UIImage imageNamed:@"blue"];
    
    CGRect inBoundsFrame = [[transitionContext containerView] bounds];
    CGRect leftOfBoundsFrame = inBoundsFrame;
    leftOfBoundsFrame.origin.x -=320;
    CGRect rightOfBoundsFrame = inBoundsFrame;
    rightOfBoundsFrame.origin.x +=320;
    
    if ([toViewController isKindOfClass:[FirstViewController class]]) {
        // show first vc again
        [transitionContext.containerView addSubview:fromViewController.view];
        [transitionContext.containerView addSubview:toViewController.view];
        
        fromViewController.view.frame = inBoundsFrame;
        toViewController.view.frame = leftOfBoundsFrame;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.frame = rightOfBoundsFrame;
            toViewController.view.frame = inBoundsFrame;
            
        } completion:^(BOOL finished) {
            
            [UIView transitionWithView:transitionContext.containerView
                              duration:self.duration
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                transitionContext.containerView.backgroundColor = [UIColor colorWithPatternImage:blueImage];
                                
                            } completion:^(BOOL finished) {
                                [transitionContext completeTransition:YES];
                                
                            }];
        }];
    }
    else {
        //display second vc
        [transitionContext.containerView addSubview:toViewController.view];
        [transitionContext.containerView addSubview:fromViewController.view];
        
        toViewController.view.frame = rightOfBoundsFrame;
        fromViewController.view.frame = inBoundsFrame;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            toViewController.view.frame = inBoundsFrame;
            fromViewController.view.frame = leftOfBoundsFrame;
            
        } completion:^(BOOL finished) {
            
            [UIView transitionWithView:transitionContext.containerView
                              duration:self.duration
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                transitionContext.containerView.backgroundColor = [UIColor colorWithPatternImage:greenImage];
                                
                            } completion:^(BOOL finished) {
                                [transitionContext completeTransition:YES];
                                
                            }];
        }];
        
        
    }
}

@end
