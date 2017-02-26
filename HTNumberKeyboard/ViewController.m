//
//  ViewController.m
//  HTNumberKeyboard
//
//  Created by 一米阳光 on 17/2/25.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"
#import "HTTextField.h"

@interface ViewController ()

@property (nonatomic, strong) HTTextField *numberTextField;
@property (nonatomic, strong) HTTextField *doubleTextField;
@property (nonatomic, strong) HTTextField *certNoTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberTextField = [[HTTextField alloc] initWithFrame:CGRectMake(50, 100, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.numberTextField.placeholder = @"纯数字键盘";
    self.numberTextField.backgroundColor = [UIColor greenColor];
    self.numberTextField.textAlignment = NSTextAlignmentLeft;
    self.numberTextField.returnKeyType = UIReturnKeyNext;
    self.numberTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.numberTextField setKeyboardType:HTKeyboardTypeNumber];
    [self.numberTextField setNumberKeyboardType:HTNumberKeyboardNumber];
    [self.view addSubview:self.numberTextField];
    
    self.doubleTextField = [[HTTextField alloc] initWithFrame:CGRectMake(50, 140, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.doubleTextField.placeholder = @"小数点键盘";
    self.doubleTextField.backgroundColor = [UIColor greenColor];
    self.doubleTextField.textAlignment = NSTextAlignmentLeft;
    self.doubleTextField.returnKeyType = UIReturnKeyNext;
    self.doubleTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.doubleTextField setKeyboardType:HTKeyboardTypeNumber];
    [self.doubleTextField setNumberKeyboardType:HTNumberKeyboardDouble];
    [self.view addSubview:self.doubleTextField];
    
    self.certNoTextField = [[HTTextField alloc] initWithFrame:CGRectMake(50, 180, CGRectGetWidth(self.view.bounds) - 100, 30)];
    self.certNoTextField.placeholder = @"身份证键盘";
    self.certNoTextField.backgroundColor = [UIColor greenColor];
    self.certNoTextField.textAlignment = NSTextAlignmentLeft;
    self.certNoTextField.returnKeyType = UIReturnKeyNext;
    self.certNoTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.certNoTextField setKeyboardType:HTKeyboardTypeNumber];
    [self.certNoTextField setNumberKeyboardType:HTNumberKeyboardCertNo];
    [self.view addSubview:self.certNoTextField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *subviews = [self.view subviews];
    for (UITextField *textField in subviews) {
        if (textField == self.numberTextField) {
            [self.numberTextField resignFirstResponder];
        } else if (textField == self.doubleTextField) {
            [self.doubleTextField resignFirstResponder];
        } else if (textField == self.certNoTextField) {
            [self.certNoTextField resignFirstResponder];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
