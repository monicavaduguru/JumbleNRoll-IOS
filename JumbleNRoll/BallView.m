//
//  BallView.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "BallView.h"

@interface BallView()
@property (readwrite) float velocity;
@end


@implementation BallView
@synthesize velocity;
@synthesize weakSelf;
@synthesize mManager ;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        mManager = [[CMMotionManager alloc] init];
        self.velocity = 100;
    }
    return self;
}
- (CMMotionManager *)mManager
{
    if (!mManager) {
        mManager = [[CMMotionManager alloc] init];
    }
    return mManager;
}

- (void)startUpdateAccelerometer
{
    NSTimeInterval updateInterval = 0.07;
    
    CGSize size = [self superview].frame.size;
	__block CGRect f = [self frame];
    
    weakSelf = self;
    
    if ([self.mManager isAccelerometerAvailable] == YES) {
        [self.mManager setAccelerometerUpdateInterval:updateInterval];
        
        [self.mManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error)
         {
             f.origin.x += (accelerometerData.acceleration.x * weakSelf.velocity) * 1;
             f.origin.y += (accelerometerData.acceleration.y * weakSelf.velocity) * -1;
             
             if(f.origin.x < 0)
                 f.origin.x = 0;
             if(f.origin.y < 0)
                 f.origin.y = 0;
             
             if(f.origin.x > (size.width - f.size.width))
                 f.origin.x = (size.width - f.size.width);
             if(f.origin.y > (size.height - f.size.height))
                 f.origin.y = (size.height - f.size.height);
             
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:0.1];
             [weakSelf setFrame:f];
             [UIView commitAnimations];
             
         }];
    }
    
}

//stops the ball from moving
- (void)stopUpdate
{
    if ([self.mManager isAccelerometerActive] == YES)
    {
        [self.mManager stopAccelerometerUpdates];
    }
    
}


@end
