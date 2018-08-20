

#import <UIKit/UIKit.h>

@interface UIView (hotTest)

//top,left,bottom,right的值大于0的时候代表热区范围减小，反之代表热区范围扩大
@property (nonatomic,assign) UIEdgeInsets hitTestInsets;

@end
