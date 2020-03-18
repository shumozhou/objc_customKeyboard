#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define margin 5
@class ALYKeyboardBtn;
@protocol ALYKeyboardBtnDelegate <NSObject>

@required
- (void)KeyboardBtnDidClick:(ALYKeyboardBtn *)btn;

@end

@interface ALYKeyboardBtn : UIButton

+ (ALYKeyboardBtn *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag  delegate:(id)delegate;

@property (nonatomic, assign) id <ALYKeyboardBtnDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
