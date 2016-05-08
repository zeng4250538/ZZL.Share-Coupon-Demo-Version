//
//  ViewController.m
//  CoinRotationEffectDemo
//
//  Created by ZZL on 16/5/5.
//  Copyright © 2016年 com.GuangZhou Rich Stone Data Technologies Company Limited.ZZL. All rights reserved.
//

#import "ViewController.h"
#import "CoinRotationEffect.h"
@interface ViewController ()
@property(nonatomic,strong)CoinRotationEffect *coin;
@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self  shakeLayout];
}

- (void) shakeLayout{

    UIView *View1 = [[UIView alloc]init];
    View1.backgroundColor = [UIColor orangeColor];
    View1.frame = CGRectMake(0, 0, 200, 200);
    
    UIView *View2 = [[UIView alloc]init];
    View2.backgroundColor = [UIColor blueColor];
    View2.frame = CGRectMake(0, 0, 200, 200);
    
    _coin = [CoinRotationEffect new];
    _coin.frame = CGRectMake((self.view.frame.size.width-200)/2,(self.view.frame.size.height-200)/2 , 200, 200);
    [_coin setPrimaryView: View1];
    [_coin setSecondaryView:View2];
    [_coin setSpinTime:0.3];
    [self.view addSubview:_coin];
    


}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  监测手机摇动的方法
 *
 *  @param motion 手机摇动的方向
 *  @param event  手机摇动的过渡
 */
- (void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    [super motionEnded:motion withEvent:event];
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake){
        [_coin flipTouched];
        NSLog(@"yao");
    }
    
}

@end
