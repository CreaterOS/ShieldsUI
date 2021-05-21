//
//  Shields.h
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import <UIKit/UIKit.h>
#import "ShieldsLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Shields : UIView
@property (nonatomic)CGFloat messageWidth;
@property (nonatomic)CGFloat cornerRadius;

- (instancetype)initWithFrame:(CGRect)frame style:(ShieldsStyle)style;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelColor:(UIColor *__nullable)labelColor messageColor:(UIColor *__nullable)messageColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelColor:(UIColor *__nullable)labelColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message messageColor:(UIColor *__nullable)messageColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelBackgroundColor:(UIColor *__nullable)labelBackgroundColor messageBackgroundColor:(UIColor *__nullable)messageBackgroundColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelBackgroundColor:(UIColor *__nullable)labelBackgroundColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message messageBackgroundColor:(UIColor *__nullable)messageBackgroundColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelBackgroundColor:(UIColor *__nullable)labelBackgroundColor messageBackgroundColor:(UIColor *__nullable)messageBackgroundColor labelColor:(UIColor *__nullable)labelColor messageColor:(UIColor *__nullable)messageColor;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelBackgroundColor:(UIColor *__nullable)labelBackgroundColor messageBackgroundColor:(UIColor *__nullable)messageBackgroundColor labelColor:(UIColor *__nullable)labelColor messageColor:(UIColor *__nullable)messageColor logo:(UIImage *__nullable)logo;

- (void)configLabel:(NSString *__nullable)label message:(NSString *__nullable)message labelBackgroundColor:(UIColor *__nullable)labelBackgroundColor messageBackgroundColor:(UIColor *__nullable)messageBackgroundColor labelColor:(UIColor *__nullable)labelColor messageColor:(UIColor *__nullable)messageColor logo:(UIImage *__nullable)logo logoWidth:(CGFloat)logoWidth logoPosition:(CGPoint)logoPosition;

@end

NS_ASSUME_NONNULL_END
