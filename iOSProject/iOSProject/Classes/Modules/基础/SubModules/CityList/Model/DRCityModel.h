//
//  DRCityModel.h
//  iOSProject
//
//  Created by Coach on 2019/7/5.
//  Copyright © 2019年 Coach Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRCityModel : NSObject

@property (nonatomic, strong) NSString *cityID;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *cityPinyin;
@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;

@end

NS_ASSUME_NONNULL_END
