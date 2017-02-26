//
//  HTNumberKeyboardView.h
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>

/** HTNumberKeyboardType自定义键盘类型
 *
 *  纯数字键盘:HTNumberKeyboardNumber
 *  小数点键盘:HTNumberKeyboardDouble
 *  身份证键盘:HTNumberKeyboardCertNo
 */
typedef NS_ENUM(NSInteger,HTNumberKeyboardType) {
    HTNumberKeyboardNumber = 0,
    HTNumberKeyboardDouble = 1,
    HTNumberKeyboardCertNo = 2
};

@protocol HTNumberKeyboardDelegate;

@interface HTNumberKeyboardView : UIView

@property (nonatomic, weak) id<HTNumberKeyboardDelegate> delegate;

- (void)createdKeyboard;

@end

@protocol HTNumberKeyboardDelegate <NSObject>

/** 点击删除按钮 */
- (BOOL)textFieldShouldDelete:(HTNumberKeyboardView *)numberKeyboard;
/** 点击键盘输入相应数字及特殊字符 */
- (void)numberKeyboard:(HTNumberKeyboardView *)numberKeyboard replacementString:(NSString *)string;
/** 获取键盘类型 */
- (HTNumberKeyboardType)numberKeyboardType:(HTNumberKeyboardView *)numberKeyboard;

@end