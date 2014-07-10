//
//  InstructionsViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstructionsViewController : UIViewController

@property (weak,nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView  * contentView;

-(IBAction) homePressed;
@end
