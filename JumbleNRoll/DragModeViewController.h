//
//  DragModeViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/20/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragModeViewController : UIViewController

@property (assign) BOOL motion;

-(IBAction) threePressed;
-(IBAction) fourPressed;
-(IBAction) fivePressed;
-(IBAction) sixPressed;
- (IBAction) switchChanged:(UISwitch *)sender;
-(IBAction) homePressed;

@end
