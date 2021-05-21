//
//  ShieldsModel.m
//  Shields
//
//  Created by Mac on 2021/5/21.
//

#import "ShieldsModel.h"

@implementation ShieldsModel
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    ShieldsModel *model = [[ShieldsModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
