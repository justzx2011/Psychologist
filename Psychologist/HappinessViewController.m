//
//  HappinessViewController.m
//  Happiness
//
//  Created by xin zhang on 12-8-12.
//  Copyright (c) 2012年 xidian university. All rights reserved.
//

#import "HappinessViewController.h"
#import "faceview.h"

@interface HappinessViewController() <FaceViewDataSource>//需要收到实现协议:FaceViewDataSource
@property (nonatomic,weak) IBOutlet faceview *faceview;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness; 
@synthesize faceview = _faceview;

- (void)setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceview setNeedsDisplay];
}

-(void)setFaceview:(faceview *)faceview
{
    _faceview = faceview;
    [self.faceview addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceview action:@selector(pinch:)]];
    [self.faceview addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];
    self.faceview.dataSource  = self;//必须设置faceview的委托为控制器
}

- (void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture
{
    //- (CGPoint)translationInView:(UIView *)view
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded))
    {
        CGPoint translation = [gesture translationInView:self.faceview];
        self.happiness -=translation.y /2;
        [gesture setTranslation:CGPointZero inView:self.faceview];
        
    }
}

- (float)smileForFaceView:(faceview *)sender
{
    return (self.happiness - 50) / 50.0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return  YES;
}
@end
