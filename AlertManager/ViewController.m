//
//  ViewController.m
//  AlertManager
//
//  Created by mac on 2020/4/23.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ViewController.h"
#import "NPLifeHealthDemandTipsView.h"
#import "SecondView.h"
#import "NPAlertManager.h"
#import "ThireView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(90, 90, 90, 90);
    button.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(systemButtonW) forControlEvents:UIControlEventTouchUpInside];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SecondView showType:2];
        
        [NPLifeHealthDemandTipsView showType:2];
        
        [ThireView showType:2];

        
        
    });
    
    // Do any additional setup after loading the view.
}


- (void)systemButtonW {
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        [SecondView showType:2];
        
        [NPLifeHealthDemandTipsView showType:2];
        
    });
}

@end
