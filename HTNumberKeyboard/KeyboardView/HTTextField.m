//
//  HTTextField.m
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "HTTextField.h"
#import "HTNumberKeyboardView.h"

@implementation UITextField (ExtentRange)

- (NSRange)selectedRange {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)setSelectedRange:(NSRange)range {
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end

@interface HTTextField () <HTNumberKeyboardDelegate> {
    HTNumberKeyboardView * numberKeyboard;
}

@end

@implementation HTTextField

- (void)awakeFromNib {
    numberKeyboard = [[HTNumberKeyboardView alloc] init];
    self.inputView = numberKeyboard;
    numberKeyboard.delegate = self;
    [numberKeyboard createdKeyboard];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ( self = [super initWithFrame:frame]) {
        [self awakeFromNib];
    }
    return self;
}

#pragma mark - BANumberKeyboardDelegate
- (BOOL)textFieldShouldDelete:(HTNumberKeyboardView *)numberKeyboard {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:@""];
    }
    if (canEditor) {
        [self deleteBackward];
    }
    return canEditor;
}

- (void)numberKeyboard:(HTNumberKeyboardView *)numberKeyboard replacementString:(NSString *)string {
    BOOL canEditor = YES;
    if ([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        canEditor = [self.delegate textField:self shouldChangeCharactersInRange:self.selectedRange replacementString:string];
    }
    
    if (canEditor) {
        [self replaceRange:self.selectedTextRange withText:string];
    }
}

- (void)setKeyboardType:(HTKeyboardType)keyboardType {
    switch (keyboardType) {
        case HTKeyboardTypeDefault:
            self.inputView = nil;
            break;
            case HTKeyboardTypeNumber:
            self.inputView = numberKeyboard;
            break;
        default:
            break;
    }
}

- (void)setNumberKeyboardType:(HTNumberKeyboardType)numberKeyboardType {
    _numberKeyboardType = numberKeyboardType;
    numberKeyboard = [[HTNumberKeyboardView alloc] init];
    self.inputView = numberKeyboard;
    numberKeyboard.delegate = self;
    [numberKeyboard createdKeyboard];
}

- (HTNumberKeyboardType)numberKeyboardType:(HTNumberKeyboardView *)numberKeyboard {
    return self.numberKeyboardType;
}

@end




