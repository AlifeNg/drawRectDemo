//
//  SecondController.m
//  drawRectDemo
//
//  Created by 吴斌清 on 16/5/9.
//  Copyright © 2016年 winphonesoftware. All rights reserved.
//

#import "SecondController.h"
#import "DrawRectView.h"

@interface SecondController ()

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     画画
     */
    DrawRectView *view = [[DrawRectView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
