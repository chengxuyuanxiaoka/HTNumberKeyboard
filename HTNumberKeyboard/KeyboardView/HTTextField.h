//
//  HTTextField.h
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTNumberKeyboardView.h"

/** HTNumberKeyboardType键盘类型
 *
 *  系统默认键盘:HTKeyboardTypeDefault
 *  自定义键盘:HTKeyboardTypeNumber
 */
typedef NS_ENUM(NSInteger,HTKeyboardType) {
    HTKeyboardTypeDefault = 0,  // 系统默认键盘
    HTKeyboardTypeNumber = 1   // 自定义键盘
};

@interface HTTextField : UITextField

@property (nonatomic, assign) HTNumberKeyboardType numberKeyboardType;

- (void)setKeyboardType:(HTKeyboardType)keyboardType;

@end

@interface UITextField (ExtentRange)

- (NSRange)selectedRange;

- (void)setSelectedRange:(NSRange)range;

@end

