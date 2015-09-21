//
//  AnimationObject.h
//  ChangingBackground
//
//  Created by Jilian Scott on 9/21/15.
//  Copyright (c) 2015 Ora Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimationObject : NSObject <UIViewControllerAnimatedTransitioning>

/*!
 @abstract Returns an initialized animation controller instance with the specified duration and animation options.
 @discussion This is the class’s designated initializer.
 @param duration The duration of the animated transition.
 @param options The animation options used during the transition. This can be used to customize what animation
 is used.
 @result An initialized simple animation controller with the specified duration and options.
 */
- (instancetype)initWithDuration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options;

/*! The duration of the transition. 0.5 by default. */
@property (nonatomic) NSTimeInterval duration;

/*! The options for the transition animation. Use this to change the type of animation. 0 by default. */
@property (nonatomic) UIViewAnimationOptions options;

@end
