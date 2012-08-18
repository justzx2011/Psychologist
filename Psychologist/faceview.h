//
//  faceview.h
//  Happiness
//
//  Created by xin zhang on 12-8-12.
//  Copyright (c) 2012年 xidian university. All rights reserved.
//

#import <UIKit/UIKit.h>


@class faceview;//有个类叫做faceview,马上就会定义这个类
@protocol FaceViewDataSource   //类的前向引用
- (float)smileForFaceView:(faceview *)sender;//这就是我们怎样去联系起想要控制FaceView笑脸程度的人,而且是在FaceView这个类一无所知的情况下,FaceView只知道他实现了这方法

@end

@interface faceview : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@property (nonatomic , weak) IBOutlet id <FaceViewDataSource> dataSource;//可以接收任意类的任意对象
    //有人想控制笑脸程度，就得把自己设为FaceView的数据源
@end
