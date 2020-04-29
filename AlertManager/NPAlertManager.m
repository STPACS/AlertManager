
//
//  NPAlertManager.m
//  AlertManager
//
//  Created by mac on 2020/4/23.
//  Copyright © 2020 mac. All rights reserved.
//

#import "NPAlertManager.h"
#import "NPBaseView.h"

@interface NPAlertManager()


@property (nonatomic, strong) UIView *currentView;//当前view

@end

@implementation NPAlertManager


static NPAlertManager *sharedSingleton_ = nil;
+ (NPAlertManager *)shared {
    if (sharedSingleton_ == nil) {
        sharedSingleton_ = [[NPAlertManager alloc] init];
    }
    return sharedSingleton_;
}

- (instancetype)init {
    if (self = [super init]) {
        
        _mtnArray = [NSMutableArray array];
        
    }
    return self;
}

- (void)addView:(UIView *)view {
    [_mtnArray addObject:view];
    
}

- (void)removeView:(UIView *)view {
    [_mtnArray removeObject:view];
    
    //取出第一个显示
    if (_mtnArray.count > 0) {
        NPBaseView *view = _mtnArray.firstObject;
        [view show];
    }
    

}

@end
