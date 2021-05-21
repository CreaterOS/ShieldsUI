//
//  ShieldsMessage.m
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import "ShieldsMessage.h"

@interface ShieldsMessage()
@property (nonatomic,strong)UILabel *message;
@end

@implementation ShieldsMessage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /// 配置UI
        [self setupUI];
    }
    return self;
}

#pragma mark - 配置UI
- (void)setupUI {
    self.backgroundColor = [UIColor colorWithRed: 108/255.0 green: 188/255.0 blue: 65/255.0 alpha:1.000];
    
    UILabel *message = [[UILabel alloc] init];
    message.textColor = UIColor.whiteColor;
    message.text = @"message";
    message.textAlignment = NSTextAlignmentCenter;
    [self addSubview:message];
    self.message = message;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat paddingL = 4;
    CGFloat paddingR = 6;
    CGFloat paddingY = 4;
    CGFloat messageX = paddingL;
    CGFloat messageY = paddingY;
    CGFloat messageW = CGRectGetWidth(self.bounds) - paddingL - paddingR;
    CGFloat messageH = CGRectGetHeight(self.bounds) - paddingY * 2.0;
    self.message.frame = CGRectMake(messageX, messageY, messageW, messageH);
}

#pragma mark - 基本配置
- (void)configMessage:(NSString *)str {
    self.message.text = str;
}

- (void)configMessage:(NSString *)str color:(UIColor *)color {
    [self configMessage:str];
    self.message.textColor = color;
}

@end
