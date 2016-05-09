//
//  ViewController.m
//  drawRectDemo
//
//  Created by 吴斌清 on 16/5/9.
//  Copyright © 2016年 winphonesoftware. All rights reserved.
//

#import "ViewController.h"
#import "BaseDrawRect.h"
#import "SecondController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     *  基础画画
     */
    BaseDrawRect *view = [[BaseDrawRect alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondController *vc = [[SecondController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
