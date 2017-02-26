//
//  HTButton.m
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "HTButton.h"
#import "UIColor+HTRGB.h"

@implementation HTButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.lineView = [[UIView alloc] initWithFrame:(CGRect){0, 0, frame.size.width, frame.size.height}];
        self.lineView.layer.borderColor = [UIColor colorWithRed:206/255.0 green:207/255.0 blue:208/255.0 alpha:1].CGColor;
        self.lineView.layer.borderWidth = 0.5;
        [self addSubview:self.lineView];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.button.titleLabel.font = [UIFont systemFontOfSize:30];
        self.button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height -0.5);
        self.button.backgroundColor = [UIColor colorWithRed:231/255.0 green:232/255.0 blue:233/255.0 alpha:1];
        [self.button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xf7f7f7]] forState:UIControlStateNormal];
        [self.button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xE7E8E9]] forState:UIControlStateHighlighted];
        [self addSubview:self.button];
    }
    return self;
}

- (void)setButtonTitle:(NSString *)title {
    [self.button setTitle:title forState:UIControlStateNormal];
}

+ (UIImage *)imageColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineWidth(context, 1.0);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
