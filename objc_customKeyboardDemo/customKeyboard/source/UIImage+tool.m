//
//  UIImage+tool.m
//  customKeyboard
//
//  Created by zcm on 2020/3/18.
//  Copyright © 2020 cn.com. All rights reserved.
//

#import "UIImage+tool.h"

@implementation UIImage (tool)
+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
     CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
     UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetFillColorWithColor(context, color.CGColor);
     CGContextFillRect(context, rect);
     UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     return image;
}
@end
