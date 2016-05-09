//
//  BaseDrawRect.m
//  drawRectDemo
//
//  Created by 吴斌清 on 16/5/9.
//  Copyright © 2016年 winphonesoftware. All rights reserved.
//

#import "BaseDrawRect.h"

#define NAVIHEIGHT 64

@implementation BaseDrawRect

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self drawRect:frame];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    //写字
    [self drawWrite:rect];
    //画直线
    [self drawLine:rect];
    //画圆
    [self drawCircle:rect];
    //画矩形
    [self drawRectangle:rect];
}

//写字
-(void)drawWrite:(CGRect)rect
{
    UIFont *font = [UIFont systemFontOfSize:15];
    //获取当前画板
    CGContextRef mainContext = UIGraphicsGetCurrentContext();
    //颜色
    CGContextSetRGBStrokeColor(mainContext, 192.0/255.0, 123.0/255.0, 48.0/255.0, 1.0);
    //画线的宽度
    CGContextSetLineWidth(mainContext, 0.25);
    //开始写字
    
    [@"我是文字" drawInRect:CGRectMake(20,40+NAVIHEIGHT,100,30)withFont:font];
    [super drawRect:rect];
}

//画线
-(void)drawLine:(CGRect)rect
{
    //获取当前画板
    CGContextRef mainContext = UIGraphicsGetCurrentContext();
    //颜色
    CGContextSetRGBStrokeColor(mainContext,0.2,0.2,0.2,1.0);
    //画线的宽度
    CGContextSetLineWidth(mainContext,0.25);
    //顶部横线
    CGContextMoveToPoint(mainContext,0,100+NAVIHEIGHT);//起始点
    CGContextAddLineToPoint(mainContext,self.bounds.size.width,70+NAVIHEIGHT);//终点
    CGContextStrokePath(mainContext);
    [super drawRect:rect];
}

//画圆
-(void)drawCircle:(CGRect)rect
{
    //当前画板
    CGContextRef mainContext = UIGraphicsGetCurrentContext();
    //颜色
    CGContextSetRGBStrokeColor(mainContext,0.2,0.2,0.2,1.0);
    //画线的宽度
    CGContextSetLineWidth(mainContext,0.25);
    
    //x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为结束的弧度，clockwise0为顺时针，1为逆时针。
    //x         =100;
    //y         =150;
    //radius    = 30;
    //start     = 0;
    //end       = 2*M_PI;
    //clockwise = 1;
    CGContextAddArc(mainContext, 100+NAVIHEIGHT, 150+NAVIHEIGHT, 30, 0, 2*M_PI, 1);//圆
    CGContextDrawPath(mainContext,kCGPathStroke);//绘制路径
    [super drawRect:rect];
}

//画矩形
-(void)drawRectangle:(CGRect)rect
{
    //获得当前画板
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //颜色
    CGContextSetRGBStrokeColor(ctx,0.2,0.2,0.2,1.0);
    //画线的宽度
    CGContextSetLineWidth(ctx,0.25);
    CGContextAddRect(ctx,CGRectMake(100,200+NAVIHEIGHT,40,30));
    CGContextStrokePath(ctx);
    [super drawRect:rect];
}
@end
