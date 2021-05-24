//
//  ShieldsLabel.m
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import "ShieldsLabel.h"

@interface ShieldsLabel()
@property (nonatomic,strong)UIImageView *logo;
@property (nonatomic,strong)UILabel *label;
@end

@implementation ShieldsLabel

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
    self.backgroundColor = [UIColor colorWithRed: 93/255.0 green: 93/255.0 blue: 93/255.0 alpha:1.000];
    
    if (style == ShieldsDefault) {
        [self onlyLabel];
    } else if (style == ShieldsLogo) {
        [self logoWithLabel];
    }
}

- (void)onlyLabel {
    CGFloat paddingL = 6;
    CGFloat paddingR = 4;
    CGFloat paddingY = 4;
    
    CGFloat labelX = paddingL;
    CGFloat labelY = paddingY;
    CGFloat labelW = CGRectGetWidth(self.bounds) - paddingL - paddingR;
    CGFloat labelH = CGRectGetHeight(self.bounds) - paddingY * 2.0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
    label.textColor = UIColor.whiteColor;
    label.text = @"label";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
}

- (void)logoWithLabel {
    /// logo
    CGFloat logoX = 2;
    CGFloat logoY = 4;
    CGFloat logoW = 20;
    CGFloat logoH = logoW;
    UIImageView *logo = [[UIImageView alloc] initWithFrame: CGRectMake(logoX, logoY, logoW, logoH)];
    logo.center = CGPointMake(logoX+logoW*0.5+5, self.center.y);
    NSString *errorLogoPath = [[NSBundle mainBundle] pathForResource:@"errorLogo" ofType:@"png"];
    logo.image = [[UIImage alloc] initWithContentsOfFile:errorLogoPath];
    logo.image = [logo.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [logo setTintColor:UIColor.whiteColor];
    [self addSubview:logo];
    self.logo = logo;
    
    /// label
    CGFloat labelX = logoX + logoW + 2;
    CGFloat labelY = logoY;
    CGFloat labelW = CGRectGetWidth(self.bounds) - labelX - 2;
    CGFloat labelH = CGRectGetHeight(self.bounds) - logoY * 2.0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
    label.textColor = UIColor.whiteColor;
    label.text = @"label";
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
}

#pragma mark - 基本配置
- (void)configLabel:(NSString *)str {
    self.label.text = str;
}

- (void)configLabel:(NSString *)str color:(UIColor *)color {
    [self configLabel:str];
    self.label.textColor = color;
}

- (void)configLogo:(UIImage *)logo {
    self.logo.image = logo;
}

- (void)configLogo:(UIImage *)logo logoWidth:(CGFloat)logoWidth {
    [self configLogo:logo];
    
    if (logoWidth != 0.0) {
        self.logo.frame = CGRectMake(self.logo.frame.origin.x, self.logo.frame.origin.y, logoWidth, logoWidth);
    }
}

- (void)configLogo:(UIImage *)logo logoWidth:(CGFloat)logoWidth logoPosition:(CGPoint)logoPosition {
    [self configLogo:logo logoWidth:logoWidth];
    self.logo.center = logoPosition;
}

@end
