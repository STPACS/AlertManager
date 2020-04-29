

//
//  NPLifeHealthDemandTipsView.m
//  NutritionPlan
//
//  Created by mac on 2020/4/16.
//  Copyright © 2020 laj. All rights reserved.
//

#import "NPLifeHealthDemandTipsView.h"
#import <Masonry.h>
#import "NPAlertManager.h"

@interface NPLifeHealthDemandTipsView ()

@property(nonatomic, strong) UIImageView *contentView;

@property(nonatomic, strong) UIImageView *lineView;

@property(nonatomic, strong) UIView *masView;

@property(nonatomic, assign) NSInteger showType;//显示类型

@property(nonatomic, assign) NSInteger count;//显示次数

@property(nonatomic, strong) NSArray *imageArray;

@end

@implementation NPLifeHealthDemandTipsView

static BOOL prepareing = NO;

static NPLifeHealthDemandTipsView *payforView = nil;

+ (NPLifeHealthDemandTipsView*)payforView {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        payforView = [[NPLifeHealthDemandTipsView alloc] initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
        
    });
    return payforView;
}

+ (void)show{
    if (prepareing) {
           return;
       }
       prepareing = YES;

       [[self payforView] prepareUI];

       [[self payforView] show];
    
}

+ (void)showType:(NSInteger)type {
    
//    if (prepareing) {
//        return;
//    }
//    prepareing = YES;
    
    [self payforView].showType = type;
    
    [self payforView].imageArray = @[@"healthDemandMask",@"healthDemandMask",@"healthDemandMask",@"healthDemandMask"];
    
    [[self payforView] prepareUI];
    
    [[self payforView] show];


}


+ (void)hide {

    [[self payforView] hide];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //遮罩
        self.masView = [[UIView alloc]init];
        [self addSubview:self.masView];
        [self.masView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        self.masView.userInteractionEnabled = YES;
        [self.masView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)]];
        
    }
    return self;
}

- (void)show {
    
    self.count = 0;
    
    [NPAlertManager.shared addView:payforView];
    if ([NPAlertManager.shared.mtnArray.firstObject isEqual:self]) {
        [UIApplication.sharedApplication.delegate.window addSubview:self];
        self.masView.backgroundColor = [UIColor darkGrayColor];
        self.masView.alpha = 0.7;
        self.alpha = 1;

    };
}

- (void)hide {
    
//    prepareing = NO;

    if (self.showType == 2) {
        
        //切换图片
        self.contentView.image = [UIImage imageNamed:self.imageArray[self.count]];
        
        self.count += 1;
        if (self.count == 3) {
            [UIView animateWithDuration:0.15 animations:^{
                self.masView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
                self.alpha = 0;
            } completion:^(BOOL finished) {

                [self removeFromSuperview];
                
                if ([NPAlertManager.shared.mtnArray.firstObject isEqual:self]) {
                       [NPAlertManager.shared removeView:payforView];
                   }
                   
            }];
        }
        
        
    }else {
        [UIView animateWithDuration:0.15 animations:^{
            self.masView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
            self.alpha = 0;
        } completion:^(BOOL finished) {

            [self removeFromSuperview];
            
            if ([NPAlertManager.shared.mtnArray.firstObject isEqual:self]) {
                   [NPAlertManager.shared removeView:payforView];
               }
               
        }];
    }
    
   
}

- (void)prepareUI {
    
    self.contentView = ({
        UIImageView *view = UIImageView.new;
        [self addSubview:view];
        view.image = [UIImage imageNamed:self.imageArray[0]];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));

        }];
        view;
    });
  
}
 
@end
