//
//  CoinRotationEffect.m
//  CoinRotationEffectDemo
//
//  Created by ZZL on 16/5/5.
//  Copyright © 2016年 com.GuangZhou Rich Stone Data Technologies Company Limited.ZZL. All rights reserved.
//

#import "CoinRotationEffect.h"

@interface CoinRotationEffect (){
    bool displayingPrimary;
}
@end

@implementation CoinRotationEffect

@synthesize primaryView=_primaryView, secondaryView=_secondaryView, spinTime;

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        displayingPrimary = YES;
        spinTime = 0.3;
    }
    return self;
}


/**
 *  设置正面
 *
 *  @param primaryView 传入正面
 */
- (void) setPrimaryView:(UIView *)primaryView{
    
    _primaryView = primaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.primaryView setFrame: frame];
    [self roundView: self.primaryView];
    self.primaryView.userInteractionEnabled = YES;
    [self addSubview: self.primaryView];
    [self roundView:self];

}

/**
 *  设置反面
 *
 *  @param secondaryView 传入反面
 */
- (void) setSecondaryView:(UIView *)secondaryView{
    
    _secondaryView = secondaryView;
    CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.secondaryView setFrame: frame];
    [self roundView: self.secondaryView];
    self.secondaryView.userInteractionEnabled = YES;
    [self addSubview: self.secondaryView];
    [self sendSubviewToBack:self.secondaryView];
    [self roundView:self];

}

/**
 *  设置图的圆角
 *
 *  @param view 传入图
 */
- (void) roundView: (UIView *) view{
    [view.layer setCornerRadius: (self.frame.size.height/2)];
    [view.layer setMasksToBounds:YES];
}


/**
 *  设置旋转
 */
- (void) flipTouched{
    [UIView transitionFromView:(displayingPrimary ? self.secondaryView : self.primaryView)
                        toView:(displayingPrimary ? self.primaryView : self.secondaryView)
                      duration: spinTime
                       options: UIViewAnimationOptionTransitionFlipFromRight+UIViewAnimationOptionCurveEaseInOut
                    completion:^(BOOL finished) {
                        if (finished) {
                            //UIView *view = (displayingPrimary ? view1 : view2);
                            
                            displayingPrimary = !displayingPrimary;
                        }
                    }
     ];
}

@end
