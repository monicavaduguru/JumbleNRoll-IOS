//
//  FirstViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BallView.h"
#import "CommonViewController.h"


@interface FirstViewController : CommonViewController<BallViewDelegate,UIAlertViewDelegate>{
    CGPoint pos;
    NSTimer *random;
  
    
    IBOutlet UIButton *start;
    
}


-(IBAction) startPressed;

-(void) checkCollision;
-(void) onTimer;



@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, strong) BallView *ballView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIView *bounderView;
@property (nonatomic, strong) UILabel *label;




@end
