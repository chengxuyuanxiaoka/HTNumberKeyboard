//
//  UIColor+HTRGB.h
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HTRGB)

+ (UIColor *)colorWithHTRGB:(int)rgb;
+ (UIColor *)colorWithRGB:(int)rgb alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString; // RRGGBB, length 6, no prefix
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
