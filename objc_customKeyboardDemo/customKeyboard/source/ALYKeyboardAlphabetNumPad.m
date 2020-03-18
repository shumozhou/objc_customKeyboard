#import "ALYKeyboardAlphabetNumPad.h"
#import "ALYKeyboardBtn.h"

@interface ALYKeyboardAlphabetNumPad ()
@property (nonatomic, weak) UITextField *responder;
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic, strong) NSArray *WORDArray;
@property (nonatomic, weak) UIButton *deleteBtn;
@property (nonatomic, weak) UIButton *okBtn;
@end

@implementation ALYKeyboardAlphabetNumPad

- (UITextField *)responder {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow valueForKey:@"firstResponder"];
    _responder = (UITextField *)firstResponder;
    return _responder;
}

- (NSArray *)WORDArray {
    
    if (!_WORDArray) {
        _WORDArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P",@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L",@"Z",@"X",@"C",@"V",@"B",@"N",@"M"];
    }
    return _WORDArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addControl];
    }
    return self;
}

- (void)addControl {
    NSMutableArray *btnArray = [NSMutableArray array];
    for (int i = 0; i< self.WORDArray.count; i++) {
        ALYKeyboardBtn *btn = [ALYKeyboardBtn buttonWithTitle:self.WORDArray[i] tag:i delegate:self];
        [btnArray addObject:btn];
        [self addSubview:btn];
    }
    self.btnArray = btnArray;
    
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteBtn setBackgroundImage:[UIImage imageNamed:@"aly_keyboard_delete_icon"] forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:deleteBtn];
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [okBtn setTitle:@"确定" forState:UIControlStateNormal];
    okBtn.backgroundColor = [UIColor greenColor];
    [okBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:11/255.0 green:98/255.0 blue:224/255.0 alpha:1]] forState:UIControlStateHighlighted];
    [okBtn setBackgroundImage:[self createImageWithColor:[UIColor colorWithRed:11/255.0 green:98/255.0 blue:224/255.0 alpha:1]] forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:okBtn];
    
    self.okBtn = okBtn;
    self.deleteBtn = deleteBtn;
    self.okBtn.layer.cornerRadius = 5.0;
    self.okBtn.layer.masksToBounds = YES;
    self.deleteBtn.layer.cornerRadius = 5.0;
    self.deleteBtn.layer.masksToBounds = YES;
}

- (void)deleteBtnClick {
    if (self.responder.text.length) {
        self.responder.text = [self.responder.text substringToIndex:self.responder.text.length-1];
    }
}

- (void)okBtnClick {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"COMMIT_TAKE_DINE_CODE_NOTI" object:nil];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat smallBtnW = (self.frame.size.width - 13*margin)/10;
    CGFloat btnH = (self.frame.size.height - 5*margin)/4;
    for (int i = 0; i < 10; i++) {
        ALYKeyboardBtn *btn = self.btnArray[i];
        btn.frame = CGRectMake(2*margin + i*(smallBtnW + margin), margin, smallBtnW, btnH);
    }
    
    for (int i = 10; i < 20; i++) {
        ALYKeyboardBtn *btn = self.btnArray[i];
        btn.frame = CGRectMake(2*margin + (i-10)*(smallBtnW + margin), 2*margin + btnH, smallBtnW, btnH);
    }
    
    for (int i = 20; i<29; i++) {
        ALYKeyboardBtn *btn = self.btnArray[i];
        btn.frame = CGRectMake(2*margin + (i-20)*(smallBtnW + margin), 3*margin + 2*btnH, smallBtnW, btnH);
    }
    
    self.deleteBtn.frame = CGRectMake(2*margin + (9)*(smallBtnW + margin), 3*margin + 2*btnH, smallBtnW, btnH);
    
    for (int i = 29; i<36; i++) {
        ALYKeyboardBtn *btn = self.btnArray[i];
        btn.frame = CGRectMake(2*margin + (i-29)*(smallBtnW + margin), 4*margin + 3*btnH, smallBtnW, btnH);
    }
    
    self.okBtn.frame = CGRectMake(2*margin + (7)*(smallBtnW + margin), 4*margin + 3*btnH, smallBtnW*3 + 2*margin, btnH);
}

#pragma mark - ALYKeyboardBtnDelegate
- (void)KeyboardBtnDidClick:(ALYKeyboardBtn *)btn {
    self.responder.text = [self.responder.text stringByAppendingString:self.WORDArray[[self.btnArray indexOfObject:btn]]];
}

- (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
