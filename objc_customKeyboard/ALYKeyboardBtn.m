#import "ALYKeyboardBtn.h"
#import "UIImage+tool.h"
@implementation ALYKeyboardBtn

+ (ALYKeyboardBtn *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag delegate:(id)delegate {
    ALYKeyboardBtn *btn = [ALYKeyboardBtn buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor]] forState:UIControlStateHighlighted];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    btn.delegate = delegate;
    
    return btn;
}

- (void)btnClick:(ALYKeyboardBtn *)btn {
    if ([self.delegate respondsToSelector:@selector(KeyboardBtnDidClick:)]) {
        [self.delegate KeyboardBtnDidClick:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


@end
