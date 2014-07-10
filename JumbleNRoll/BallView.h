//
//  BallView.h
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
@protocol BallViewDelegate
@end


@interface BallView : UIView

@property (nonatomic, strong) CMMotionManager *mManager;
@property (nonatomic, weak) id<BallViewDelegate> delegate;
@property (weak) BallView * __weak weakSelf;

- (void)startUpdateAccelerometer;
- (void)stopUpdate;
@end
