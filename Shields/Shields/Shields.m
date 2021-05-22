//
//  Shields.m
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import "Shields.h"
#import "ShieldsMessage.h"
#import "ShieldsModel.h"
#import <WebKit/WKWebView.h>

@interface Shields()
@property (nonatomic,strong)ShieldsLabel *label;
@property (nonatomic,strong)ShieldsMessage *message;
@end

@implementation Shields
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /// 配置UI
        [self setupUI:ShieldsDefault];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(ShieldsStyle)style {
    self = [super initWithFrame:frame];
    if (self) {
        /// 配置UI
        [self setupUI:style];
    }
    return self;
}

#pragma mark - 配置UI
- (void)setupUI:(ShieldsStyle)style {
    /// label
    CGFloat labelW = CGRectGetWidth(self.frame) * 0.4;
    ShieldsLabel *label = [[ShieldsLabel alloc] initWithFrame:CGRectMake(0, 0, labelW, CGRectGetHeight(self.frame)) style:style];
    [self addSubview:label];
    self.label = label;
    
    CGFloat messageW = CGRectGetWidth(self.frame) - labelW;
    /// message
    ShieldsMessage *message = [[ShieldsMessage alloc] initWithFrame:CGRectMake(labelW, 0, messageW, CGRectGetHeight(self.frame))];
    [self addSubview:message];
    self.message = message;
}

- (void)configLabel:(NSString *)label message:(NSString *)message {
    [self configLabel:label message:message labelColor:nil messageColor:nil];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelColor:(UIColor *)labelColor messageColor:(UIColor *)messageColor {
    [self configLabel:label message:message labelBackgroundColor:nil messageBackgroundColor:nil labelColor:labelColor messageColor:messageColor logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelColor:(UIColor *)labelColor {
    [self configLabel:label message:message labelBackgroundColor:nil messageBackgroundColor:nil labelColor:labelColor messageColor:nil logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message messageColor:(UIColor *)messageColor {
    [self configLabel:label message:message labelBackgroundColor:nil messageBackgroundColor:nil labelColor:nil messageColor:messageColor logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelBackgroundColor:(UIColor *)labelBackgroundColor messageBackgroundColor:(UIColor *)messageBackgroundColor {
    [self configLabel:label message:message labelBackgroundColor:labelBackgroundColor messageBackgroundColor:messageBackgroundColor labelColor:nil messageColor:nil logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelBackgroundColor:(UIColor *)labelBackgroundColor {
    [self configLabel:label message:message labelBackgroundColor:labelBackgroundColor messageBackgroundColor:nil labelColor:nil messageColor:nil logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message messageBackgroundColor:(UIColor *)messageBackgroundColor {
    [self configLabel:label message:message labelBackgroundColor:nil messageBackgroundColor:messageBackgroundColor labelColor:nil messageColor:nil logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelBackgroundColor:(UIColor *)labelBackgroundColor messageBackgroundColor:(UIColor *)messageBackgroundColor labelColor:(UIColor *)labelColor messageColor:(UIColor *)messageColor {
    [self configLabel:label message:message labelBackgroundColor:labelBackgroundColor messageBackgroundColor:messageBackgroundColor labelColor:labelColor messageColor:messageColor logo:nil logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelBackgroundColor:(UIColor *)labelBackgroundColor messageBackgroundColor:(UIColor *)messageBackgroundColor labelColor:(UIColor *)labelColor messageColor:(UIColor *)messageColor logo:(UIImage *)logo {
    [self configLabel:label message:message labelBackgroundColor:labelBackgroundColor messageBackgroundColor:messageBackgroundColor labelColor:labelColor messageColor:messageColor logo:logo logoWidth:0.0 logoPosition:CGPointZero];
}

- (void)configLabel:(NSString *)label message:(NSString *)message labelBackgroundColor:(UIColor *)labelBackgroundColor messageBackgroundColor:(UIColor *)messageBackgroundColor labelColor:(UIColor *)labelColor messageColor:(UIColor *)messageColor logo:(UIImage *)logo logoWidth:(CGFloat)logoWidth logoPosition:(CGPoint)logoPosition {
    if (self.label == nil && self.message == nil) {
        return ;
    }
    
    if (labelBackgroundColor != nil) {
        /// label背景颜色
        self.label.backgroundColor = labelBackgroundColor;
    }
    
    if (messageBackgroundColor != nil) {
        /// message背景颜色
        self.message.backgroundColor = messageBackgroundColor;
    }
    
    if (labelColor != nil) {
        /// 标签颜色
        [self.label configLabel:label color:labelColor];
    }
    
    if (messageColor != nil) {
        /// 信息颜色
        [self.message configMessage:message color:messageColor];
    }
    
    if (logo != nil) {
        [self.label configLogo:logo logoWidth:logoWidth logoPosition:logoPosition];
    }
}

#pragma mark - Json文件读取配置
- (void)configWithJsonFilePath:(NSString *)jsonPath {
    if (jsonPath.length != 0) {
        [self configJsonWithData:[NSData dataWithContentsOfFile:jsonPath]];
    }
}

- (void)configWithJsonFileURL:(NSURL *)jsonURL {
    if (jsonURL != nil) {
        [self configJsonWithData:[NSData dataWithContentsOfURL:jsonURL]];
    }
}

- (void)configJsonWithData:(NSData *)data {
    NSError *error = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error != nil) {
        NSLog(@"%@",error.localizedDescription);
        return ;
    }
    
    [self configWithModel:[ShieldsModel modelWithDict:dict]];
}

- (void)configWithModel:(ShieldsModel *)model {
    [self configLabel:model.label message:model.message labelBackgroundColor:model.labelBackgroundColor messageBackgroundColor:model.messageBackgroundColor labelColor:model.labelColor messageColor:model.messageColor logo:[UIImage imageNamed:model.logoName] logoWidth:model.logoWidth logoPosition:model.logoPosition];
}

#pragma mark - 配置属性
- (void)setMessageWidth:(CGFloat)messageWidth {
    _messageWidth = messageWidth;
    if (self.message != nil) {
        CGPoint center = self.center;
        self.message.frame = CGRectMake(self.message.frame.origin.x, self.message.frame.origin.y, messageWidth, CGRectGetHeight(self.message.frame));
        [self.message layoutSubviews];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, CGRectGetWidth(self.label.frame)+messageWidth, CGRectGetHeight(self.frame));
        self.center = center;
    }
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

@end
