//
//  UIColor+ShieldsHex.m
//  Shields
//
//  Created by Bryant Reyn on 2021/5/22.
//

#import "UIColor+ShieldsHex.h"

@implementation UIColor (ShieldsHex)

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    /// Separate into r,g,b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    /// red
    NSString *rStr = [cString substringWithRange:range];
    /// green
    range.location = 2;
    NSString *gStr = [cString substringWithRange:range];
    /// blue
    range.location = 4;
    NSString *bStr = [cString substringWithRange:range];
    /// Scan values
    unsigned int r,g,b;
    [[NSScanner scannerWithString:rStr] scanHexInt:&r];
    [[NSScanner scannerWithString:gStr] scanHexInt:&g];
    [[NSScanner scannerWithString:bStr] scanHexInt:&b];
    
    return [UIColor colorWithRed:(CGFloat)(r/255.0) green:(CGFloat)(g/255.0) blue:(CGFloat)(b/255.0) alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color alpha:1];
}

@end
