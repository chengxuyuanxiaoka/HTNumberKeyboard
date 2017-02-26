//
//  HTButton.h
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTButton : UIView

@property (nonatomic, strong) UIButton * button;
@property (nonatomic, strong) UIView * lineView;

+ (UIImage *)imageColor:(UIColor *)color;

- (void)setButtonTitle:(NSString *)title;

@end
