//
//  CoinRotationEffect.h
//  CoinRotationEffectDemo
//
//  Created by ZZL on 16/5/5.
//  Copyright © 2016年 com.GuangZhou Rich Stone Data Technologies Company Limited.ZZL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoinRotationEffect : UIView

//- (id) initWithPrimaryView: (UIView *) view1 andSecondaryView: (UIView *) view2 inFrame: (CGRect) frame;

@property (nonatomic, retain) UIView *primaryView;
@property (nonatomic, retain) UIView *secondaryView;
@property float spinTime;

- (void) flipTouched;


@end
