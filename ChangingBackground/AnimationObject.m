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
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        //display second vc
        [transitionContext.containerView addSubview:toViewController.view];
        [transitionContext.containerView addSubview:fromViewController.view];
        
        toViewController.view.frame = rightOfBoundsFrame;
        fromViewController.view.frame = inBoundsFrame;
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            
            toViewController.view.frame = inBoundsFrame;
            fromViewController.view.frame = leftOfBoundsFrame;

        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

//    self.transitionContext = transitionContext;
//    UIImageView __block *containerView = (UIImageView *)self.transitionContext.containerView;
//
//    UIImage *greenImage = [UIImage imageNamed:@"green"];
//    UIImage *blueImage = [UIImage imageNamed:@"blue"];
//    //containerView.backgroundColor = [UIColor colorWithPatternImage:blueImage];
//
//    UIViewController *fromViewController = [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toViewController = [self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
//    [toViewController.view layoutIfNeeded];
//
//    //[containerView addSubview:toViewController.view];
//    // toViewController.view.alpha = 0;
//
//    //    toViewController.view.layer.mask = self.fadeView.layer;
//    //    BOOL optionsContainShowHideTransitionViews = (self.options & UIViewAnimationOptionShowHideTransitionViews) != 0;
//    //    if (!optionsContainShowHideTransitionViews) {
//    //        [[transitionContext containerView] addSubview:toViewController.view];
//    //    }
//    //[containerView bringSubviewToFront:toViewController.view];
//
//    CGRect endFrame = [[transitionContext containerView] bounds];
//    CGRect startFrame = endFrame;
//    startFrame.origin.x += 320;
//
//    if ([toViewController isKindOfClass:[FirstViewController class]]) {
//
//        [transitionContext.containerView addSubview:fromViewController.view];
//        [transitionContext.containerView addSubview:toViewController.view];
//
//        toViewController.view.frame = startFrame;
//
//        [UIView transitionWithView:containerView
//                          duration:self.duration
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        animations:^{
//
//                            containerView.backgroundColor = [UIColor colorWithPatternImage:blueImage];
//                            toViewController.view.frame = endFrame;
//
//                        } completion:^(BOOL finished) {
//
//                            [transitionContext completeTransition:YES];
//
//                        }];
//    } else {
//
//        [transitionContext.containerView addSubview:toViewController.view];
//        [transitionContext.containerView addSubview:fromViewController.view];
//
//        endFrame.origin.x -= CGRectGetWidth([[transitionContext containerView] bounds]);
//
//        [UIView transitionWithView:containerView
//                          duration:self.duration
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        animations:^{
//
//                            containerView.backgroundColor = [UIColor colorWithPatternImage:greenImage];
//                            fromViewController.view.frame = startFrame;
//
//                        } completion:^(BOOL finished) {
//
//                            [transitionContext completeTransition:YES];
//
//                        }];
//
//        //        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        //            fromViewController.view.frame = endFrame;
//        //        } completion:^(BOOL finished) {
//        //            [transitionContext completeTransition:YES];
//        //        }];
//    }
//
////    [UIView transitionWithView:containerView
////                      duration:[self transitionDuration:transitionContext]
////                       options:UIViewAnimationOptionTransitionCrossDissolve
////                    animations:^{
////                        if ([toViewController isKindOfClass:[FirstViewController class]]) {
////                            //pop second off, show first
////
////
////
////
////                        } else {
////                            //push to second
////                            containerView.backgroundColor = [UIColor colorWithPatternImage:greenImage];
////                            toViewController.view.frame = endFrame;
////
////                            [transitionContext.containerView addSubview:toViewController.view];
////                            [transitionContext.containerView addSubview:fromViewController.view];
////
////                        }
////                        fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
////                    } completion:^(BOOL finished) {
////                        fromViewController.view.transform = CGAffineTransformIdentity;
////                        [transitionContext completeTransition:YES];
////
////                    }];
//
//
//
//
//    //    else {
//    //        toViewController.view.userInteractionEnabled = YES;
//    //
//    //        [transitionContext.containerView addSubview:toViewController.view];
//    //        [transitionContext.containerView addSubview:fromViewController.view];
//    //
//    //        endFrame.origin.x += 320;
//    //
//    //        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//    //            toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
//    //            fromViewController.view.frame = endFrame;
//    //        } completion:^(BOOL finished) {
//    //            [transitionContext completeTransition:YES];
//    //        }];
//    //    }
//
//}
//
////static NSArray *locations(float a, float b, float c, float d)
////{
////    return [NSArray arrayWithObjects:
////            [NSNumber numberWithFloat:a],
////            [NSNumber numberWithFloat:b],
////            [NSNumber numberWithFloat:c],
////            [NSNumber numberWithFloat:d],
////            nil];
////}
//
////- (void)fadeIn
////{
////    [CATransaction begin];
////    [CATransaction setValue:[NSNumber numberWithDouble:2.0] forKey:kCATransactionAnimationDuration];
////    ((CAGradientLayer *)self.fadeView.layer.mask).locations = locations(-1, -1, 0, 1);
////    [CATransaction commit];
////}
////
////- (void)fadeOut
////{
////    [CATransaction begin];
////    [CATransaction setValue:[NSNumber numberWithDouble:2.0] forKey:kCATransactionAnimationDuration];
////    ((CAGradientLayer *)self.fadeView.layer.mask).locations = locations(0, 1, 2, 2);
////    [CATransaction commit];
////}


@end
