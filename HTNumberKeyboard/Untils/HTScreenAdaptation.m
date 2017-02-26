//
//  HTScreenAdaptation.m
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "HTScreenAdaptation.h"

@implementation HTScreenAdaptation

+ (CGRect)adapterRectByWidth:(CGRect)rect {
    return (CGRect){rect.origin.x * [self adapterMultipleByWidth],rect.origin.y * [self adapterMultipleByWidth], rect.size.width * [self adapterMultipleByWidth], rect.size.height * [self adapterMultipleByWidth]};
}

+ (CGFloat)adapterMultipleByWidth {
    return [UIApplication sharedApplication].keyWindow.bounds.size.width / 375.0;
}

@end
