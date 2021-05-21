//
//  ShieldsLabel.h
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ShieldsStyle) {
    ShieldsDefault,
    ShieldsLogo
};

NS_ASSUME_NONNULL_BEGIN

@interface ShieldsLabel : UIView
- (instancetype)initWithFrame:(CGRect)frame style:(ShieldsStyle)style;

- (void)configLabel:(NSString *)str;
- (void)configLabel:(NSString *)str color:(UIColor *)color;

- (void)configLogo:(UIImage *)logo;
- (void)configLogo:(UIImage *)logo logoWidth:(CGFloat)logoWidth;
- (void)configLogo:(UIImage *)logo logoWidth:(CGFloat)logoWidth logoPosition:(CGPoint)logoPosition;
@end

NS_ASSUME_NONNULL_END
