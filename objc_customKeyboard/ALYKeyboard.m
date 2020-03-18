#import "ALYKeyboard.h"
#import "ALYKeyboardAlphabetNumPad.h"

#define  iPhone4     ([[UIScreen mainScreen] bounds].size.height==480)
#define  iPhone5     ([[UIScreen mainScreen] bounds].size.height==568)
#define  iPhone6     ([[UIScreen mainScreen] bounds].size.height==667)
#define  iPhone6plus ([[UIScreen mainScreen] bounds].size.height==736)
#define  iPhone5_15 ([[UIScreen mainScreen] bounds].size.height==812)
#define  iPhone6_1 ([[UIScreen mainScreen] bounds].size.height==896)

@interface ALYKeyboard ()

@property (nonatomic, weak) ALYKeyboardAlphabetNumPad *numPad;

@end

@implementation ALYKeyboard
- (instancetype)init {
   
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:116/255.0 green:144/255.0 blue:194/255.0 alpha:0.2];
        CGRect rect = CGRectZero;
        if (iPhone4 || iPhone5) {
            rect = CGRectMake(0, 0, 320, 216);
        } else if (iPhone6 || iPhone5_15) {
            rect = CGRectMake(0, 0, 375, 216);
        } else {
            rect = CGRectMake(0, 0, 414, 226);
        }
        
        self.frame = rect;
        ALYKeyboardAlphabetNumPad *numPad = [[ALYKeyboardAlphabetNumPad alloc] initWithFrame:rect];
        self.numPad = numPad;
        [self addSubview:numPad];
    }
    return self;
}


@end
