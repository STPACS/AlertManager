//
//  NPAlertManager.h
//  AlertManager
//
//  Created by mac on 2020/4/23.
//  Copyright © 2020 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NPAlertManager : NSObject

+ (instancetype)shared;

//将view添加到数组中
- (void)addView:(UIView *)view;

//移除View
- (void)removeView:(UIView *)view;

@property (nonatomic, strong) NSMutableArray *mtnArray;


@end

NS_ASSUME_NONNULL_END
