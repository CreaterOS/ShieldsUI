//
//  ShieldsMessage.h
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShieldsMessage : UIView
- (void)configMessage:(NSString *)str;
- (void)configMessage:(NSString *)str color:(UIColor *)color; 
@end

NS_ASSUME_NONNULL_END
