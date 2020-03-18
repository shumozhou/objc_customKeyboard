//
//  ViewController.m
//  customKeyboard
//
//  Created by zcm on 2020/3/18.
//  Copyright © 2020 cn.com. All rights reserved.
//

#import "ViewController.h"
#import "ALYKeyboard.h"
@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.textField.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 60);
    [self.view addSubview:self.textField];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.inputView = [[ALYKeyboard alloc] init];
        _textField.backgroundColor = [UIColor redColor];
    }
    return _textField;
}
@end
