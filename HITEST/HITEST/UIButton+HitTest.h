//
//  UIButton+HitTest.h
//  HITEST
//
//  Created by youxin on 2018/8/20.
//  Copyright © 2018年 yst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HitTest)

//top,left,bottom,right的值大于0的时候代表热区范围减小，反之代表热区范围扩大
@property (nonatomic,assign) UIEdgeInsets hitTestInsets;

@end
