//
//  DrawRectView.m
//  drawRectDemo
//
//  Created by 吴斌清 on 16/5/9.
//  Copyright © 2016年 winphonesoftware. All rights reserved.
//

#import "DrawRectView.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height
#define NAVIHEIGHT 64

@implementation DrawRectView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self drawRect:frame];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [self p_drawArc];//画弧
    
    [self p_leftEye];
    
    [self p_rightEye];
    
    [self p_mouth];
    
    [self p_drawCurv]; // 绘制曲线
//
    [self p_drawRect];//矩形

    [self p_drawEllip];//椭圆
    
    [self p_drawLines];//我也不知道这是个啥T T
}


#pragma mark -- drawRect
//画弧
- (void)p_drawArc{
    
    CGContextRef arcContext = UIGraphicsGetCurrentContext();
    // 参数： context， 原点坐标， 半径， 开始弧度M_PI_2 (90度)， 结束弧度，顺时针还是逆时针，（0 ： 顺 ； 1 ： 逆）
    
    CGContextAddArc(arcContext, 375 / 2, 300, 100, 0, M_PI * 2, 1);
    
    [[UIColor colorWithRed:1.000 green:0.722 blue:0.624 alpha:1.000] setFill];
    
    [[UIColor magentaColor] setStroke];
    
    //    CGContextSetLineWidth(arcContext, 15);
    
    CGContextDrawPath(arcContext, kCGPathFillStroke);
    
    //    CGContextFillPath(arcContext);
    
}

- (void)p_leftEye

{
    
    // 笑脸的眼睛
    
    CGContextRef leftContext = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(leftContext, 375 / 2 - 45, 300 - 30, 18, 0, M_PI * 2, 1);
    
    [[UIColor blackColor] setFill];
    
    CGContextFillPath(leftContext);
    
}

- (void)p_rightEye

{
    
    // 笑脸的眼睛
    
    CGContextRef rightContext = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(rightContext, 375 / 2 + 45, 300 - 30, 18, 0, M_PI * 2, 1);
    
    [[UIColor blackColor] setFill];
    
    CGContextFillPath(rightContext);
    
}

- (void)p_mouth{
    
    CGContextRef mouthContext = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(mouthContext, 375 / 2, 300 + 30, 25, 0, M_PI, 0);
    
    [[UIColor redColor] set];
    
    CGContextSetLineWidth(mouthContext, 2);
    
    CGContextStrokePath(mouthContext);
    
}

// 绘制曲线

- (void)p_drawCurv

{
    
    CGContextRef curveContext = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(curveContext, 50, 600);
    
    // 绘制贝塞尔曲线
    
    //    //参数 ：
    
    // 参数1: 绘制目标
    
    // 参数2: 控制点1的x坐标
    
    // 参数3: 控制点1的y坐标
    
    // 参数4: 控制点2的x坐标
    
    // 参数5: 控制点2的y坐标
    
    // 参数6: 终点x坐标
    
    // 参数7: 终点y坐标
    
    CGContextAddCurveToPoint(curveContext, 375 / 2, 380, 150, 520, 350, 500);
    CGContextStrokePath(curveContext);
    
}

// 形状 矩形

- (void)p_drawRect

{
    
    CGContextRef rectContext = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(rectContext, CGRectMake(375 / 2, 20+NAVIHEIGHT, 100, 100));
    
    [[UIColor purpleColor] set];
    
    CGContextSetLineWidth(rectContext, 6);
    
    [[UIColor brownColor] setFill];
    
    CGContextStrokePath(rectContext);
    
}

- (void)p_drawEllip

{
    
    CGContextRef ellipContext = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(ellipContext, CGRectMake(20, 20+NAVIHEIGHT, 100, 150));
    
    [[UIColor blueColor] set];
    
    CGContextStrokePath(ellipContext);
}

// 私有方法建议加p前缀

- (void)p_drawLines{
    
    // Graphics Context : 绘制的目标
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置颜色 方法：
    
    [[UIColor colorWithRed:1.000 green:0.332 blue:0.896 alpha:1.000] set];
    
    //    CGContextSetRGBStrokeColor(context, 113 / 255.0, 267 / 255.0, 68 / 255.0, 1);
    
    // 设置绘制的起点， 系统会追踪至该点进行绘制
    
    //    CGContextMoveToPoint(context, 100, 200);
    
    //    CGContextAddLineToPoint(context, 200, 100);
    
    //
    
    //    CGContextAddLineToPoint(context, 300, 100);
    
    //
    
    // 参数二是个cgpoint的数组 ; 当使用这个函数的时候，这里的第一个点默认为起点了。
    
    CGPoint pointArr[] = {CGPointMake(300, 600),CGPointMake(200, 550),CGPointMake(250, 500)};
    
    CGContextAddLines(context, pointArr, sizeof(pointArr) / sizeof(CGPoint));
    
    [[UIColor brownColor] setFill];
    
    // 闭合
    
    CGContextClosePath(context);
    
    CGContextFillPath(context);
    
    //    CGContextDrawPath(context, kCGPathFillStroke);
    
    //描边, 默认黑色
    
    //    CGContextStrokePath(context);
    
}


@end
