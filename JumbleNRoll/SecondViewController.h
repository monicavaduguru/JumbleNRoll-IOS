//
//  SecondViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/11/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonViewController.h"

@interface SecondViewController : CommonViewController<UIAlertViewDelegate>{
    NSTimer *random;
    NSTimer *random1;
   
    
    IBOutlet UIButton *start;

    BOOL moveFlag;
    
}



-(IBAction) startPressed;

-(void) checkCollision;
-(void) onTimer;
-(void) createPlayer;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@end
