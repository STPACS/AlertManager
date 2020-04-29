//
//  SecondView.h
//  AlertManager
//
//  Created by mac on 2020/4/23.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondView : NPBaseView

+ (void)show;//1,健康需求档案，2，首页

+ (void)showType:(NSInteger)type;//1,健康需求档案，2，首页

+ (void)hide;

@end

NS_ASSUME_NONNULL_END
