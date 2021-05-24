//
//  ShieldsModel.h
//  Shields
//
//  Created by Mac on 2021/5/21.
//
/*!
 @header ShieldsModel
 @abstract ShieldsModel 徽章模型
 @author CreaterOS
 @version 1.00 2021/5/21 Creation (此文档的版本信息)
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShieldsModel : NSObject
@property (nonatomic)NSUInteger schemaVersion;
@property (nonatomic,copy)NSString *label;
@property (nonatomic,copy)NSString *message;
@property (nonatomic,strong)UIColor *labelBackgroundColor;
@property (nonatomic,strong)UIColor *messageBackgroundColor;
@property (nonatomic,strong)UIColor *labelColor;
@property (nonatomic,strong)UIColor *messageColor;
@property (nonatomic,copy)NSString *logoName;
@property (nonatomic)CGFloat logoWidth;
@property (nonatomic)CGPoint logoPosition;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
