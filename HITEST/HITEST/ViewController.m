//
//  ViewController.m
//  HITEST
//
//  Created by youxin on 2018/8/20.
//  Copyright © 2018年 yst. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+HitTest.h"
#import "UIView+hotTest.h"
#import "HeaderView.h"

@interface ViewController (){
   UIView *headView;
    UIView *alview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //1 扩大热区例子
    UIView *vv = [[UIView alloc]init];
    vv.frame = CGRectMake(100, 400, 100, 100);
    vv.backgroundColor =[UIColor greenColor];
    [self.view addSubview:vv];
    vv.hitTestInsets = UIEdgeInsetsMake(-50, -50, -50, -50);
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aa:)];
    [vv addGestureRecognizer:tap];
    
    //通过hittest使用 超出btn的范围依然可以点击
    UIButton *button = [UIButton new];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 30);
    button.backgroundColor = [UIColor redColor];
    //button.center = self.view.center;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    //    button.hitTestInsets = UIEdgeInsetsMake(15, 50, 15, 50);//热区范围为0
    
    //增大热点区
    button.hitTestInsets = UIEdgeInsetsMake(-15, -50, -105, -500);
   
    [vv addSubview:button];
    
    //2 透过视图点击
   //  alview 为 headView 的子视图 子视图在超出父视图部分不可点击 通过hittest 可以实现
    
    headView =[[HeaderView alloc]init];
//    headView =[[UIView alloc]init]; //当此处为UIView 超出父视图部分不可点击
    headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 100);
    headView.backgroundColor =[UIColor cyanColor];
    [self.view addSubview:headView];

    alview =[[UIView alloc]init];
    alview.frame = CGRectMake(0, 100, self.view.frame.size.width, 300);
    alview.backgroundColor =[UIColor greenColor];
    [headView addSubview:alview];
     alview.hidden = YES;
    
    UITapGestureRecognizer *tap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(test2)];
    [headView addGestureRecognizer:tap2];
    
    
    UITapGestureRecognizer *tap3 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(test3)];
    [alview addGestureRecognizer:tap3];
    
}

- (void)test2{
    NSLog(@"头部视图");
    alview.hidden = NO;

}

- (void)test3{
    NSLog(@"蓝色视图");
    alview.hidden = YES;
}

-(void)aa:(UITapGestureRecognizer*)tap{
    
    NSLog(@"VVVVVV");
}
#pragma mark - - - - UIEvent - - - -
- (void)buttonClicked:(UIButton *)button{
    NSLog(@"AAAAAA");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
