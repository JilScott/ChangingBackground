//
//  UIColor+UIColor_ChangingBackgrounds.m
//  ChangingBackground
//
//  Created by Jilian Scott on 9/22/15.
//  Copyright (c) 2015 Ora Interactive. All rights reserved.
//

#import "UIColor+UIColor_ChangingBackgrounds.h"

@implementation UIColor (UIColor_ChangingBackgrounds)

+ (UIColor *)greenImage {
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"green"]];
}

+ (UIColor *)blueImage {
    return [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue"]];
}

@end
