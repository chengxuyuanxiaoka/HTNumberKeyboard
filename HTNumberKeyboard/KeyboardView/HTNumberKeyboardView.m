//
//  HTNumberKeyboardView.m
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "HTNumberKeyboardView.h"
#import "HTButton.h"
#import "UIColor+HTRGB.h"

@interface HTNumberKeyboardView ()

@property (nonatomic, strong) NSArray *keyboardTitle;

@end

@implementation HTNumberKeyboardView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectMake(0, HTHeight - 216, HTWidth, 216)]) {
        self.backgroundColor = [UIColor colorWithRed:206/255.0 green:207/255.0 blue:208/255.0 alpha:1];
        self.frame = CGRectMake(0, HTHeight - 216, HTWidth, 216);
    }
    return self;
}

- (void)createdKeyboard {
    if ([self.delegate numberKeyboardType:self] == HTNumberKeyboardCertNo) {
        self.keyboardTitle = [self keyboardTypeCertNoButtonTitle];
    } else if ([self.delegate numberKeyboardType:self] == HTNumberKeyboardNumber){
        self.keyboardTitle = [self keyboardTypeNumberButtonTitle];
    }else if ([self.delegate numberKeyboardType:self] == HTNumberKeyboardDouble) {
        self.keyboardTitle = [self keyboardTypeDoubleButtonTitle];
    }
    
    CGFloat buttonWidth = (HTWidth - 1.5) / 3;
    CGFloat top = 0;
    for (NSInteger index = 0; index < 11; index ++) {
        HTButton * button = [[HTButton alloc] initWithFrame:(CGRect){(index % 3) * (buttonWidth+0.5),top+(index / 3) * 54,buttonWidth,54}];
        button.tag = 1000 + index;
        if ([self.delegate numberKeyboardType:self] == HTNumberKeyboardNumber && index == 9) {
            button.button.enabled = NO;
            [button.button setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1] forState:UIControlStateNormal];
            [button.button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xE7E8E9]] forState:UIControlStateNormal];
        }
        [button setButtonTitle:self.keyboardTitle[index]];
        [button.button addTarget:self action:@selector(keyButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    HTButton * button = [[HTButton alloc] initWithFrame:(CGRect){(11 % 3) * (buttonWidth+0.5),top+(11 / 3) * 54,buttonWidth,54}];
    [button.button setImage:[UIImage imageNamed:@"keyboard_delete"] forState:UIControlStateNormal];
    [button.button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xE7E8E9]] forState:UIControlStateNormal];
    [button.button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xf7f7f7]] forState:UIControlStateHighlighted];
    [button.button addTarget:self action:@selector(deleteButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (NSArray *)keyboardTypeCertNoButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"X",@"0",@""];
}

- (NSArray *)keyboardTypeDoubleButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@"0",@""];
}

- (NSArray *)keyboardTypeNumberButtonTitle {
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@""];
}

- (void)keyButtonOnclick:(UIButton *) button {
    if([self.delegate respondsToSelector:@selector(numberKeyboard:replacementString:)]) {
        NSInteger index = [button.superview tag] - 1000;
        if (self.keyboardTitle.count > index) {
            [self.delegate numberKeyboard:self replacementString:self.keyboardTitle[index]];
        }
    }
}

- (void)deleteButtonOnclick:(UIButton *) button {
    [self.delegate textFieldShouldDelete:self];
}

@end
