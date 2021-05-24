//
//  UIColor+ShieldsHex.h
//  Shields
//
//  Created by Bryant Reyn on 2021/5/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ShieldsHex)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;
@end

NS_ASSUME_NONNULL_END
