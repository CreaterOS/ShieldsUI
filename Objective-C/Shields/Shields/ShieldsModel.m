//
//  ShieldsModel.m
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import "ShieldsModel.h"
#import "UIColor+ShieldsHex.h"

#define HEX @"hex"
#define ALPHA @"alpha"

#define LOGOX @"X"
#define LOGOY @"Y"

@implementation ShieldsModel
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    ShieldsModel *model = [[ShieldsModel alloc] init];
    
    for (NSString *key in dict.allKeys) {
        id value = dict[key];
        if ([key isEqualToString:@"schemaVersion"]) {
            model.schemaVersion = (NSUInteger)value;
        } else if ([key isEqualToString:@"label"] || [key isEqualToString:@"message"] || [key isEqualToString:@"logoName"]) {
            [model setValue:value forKey:key];
        } else if ([key isEqualToString:@"logoWidth"]) {
            model.logoWidth = (CGFloat)[(NSString *)value floatValue];
        } else if ([key isEqualToString:@"labelBackgroundColor"] || [key isEqualToString:@"messageBackgroundColor"] || [key isEqualToString:@"labelColor"] || [key isEqualToString:@"messageColor"]) {
            NSDictionary *colorDict = (NSDictionary *)value;
            if (colorDict.count != 0) {
                NSString *hexStr = [NSString string];
                CGFloat alpha = 0.0;
                NSArray<NSString *> *allKeys = colorDict.allKeys;
                if ([allKeys containsObject:HEX]) {
                    hexStr = colorDict[HEX];
                }
                if ([allKeys containsObject:ALPHA]) {
                    alpha = (CGFloat)[(NSString *)colorDict[ALPHA] floatValue];
                }
                
                UIColor *color = [UIColor colorWithHexString:hexStr alpha:alpha];
                [model setValue:color forKey:key];
            }
        } else if ([key isEqualToString:@"logoPosition"]) {
            NSDictionary *locationDict = (NSDictionary *)value;
            NSArray<NSString *> *allKeys = locationDict.allKeys;
            CGFloat x = 0.0;
            CGFloat y = 0.0;
            if ([allKeys containsObject:LOGOX]) {
                x = (CGFloat)[(NSString *)locationDict[LOGOX] floatValue];
            }
            if ([allKeys containsObject:LOGOY]) {
                y = (CGFloat)[(NSString *)locationDict[LOGOY] floatValue];
            }
            model.logoPosition = CGPointMake(x, y);
        }
    }
    
    return model;
}

@end
