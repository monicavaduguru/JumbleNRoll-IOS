//
//  BestTimesControllerViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/30/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestTimesControllerViewController : UIViewController


    @property (weak,nonatomic) IBOutlet UILabel *roll3;
    @property (weak,nonatomic) IBOutlet UILabel *roll4;
    @property (weak,nonatomic) IBOutlet UILabel *roll5;
    @property (weak,nonatomic) IBOutlet UILabel *roll6;
    @property (weak,nonatomic) IBOutlet UILabel *drag3;
    @property (weak,nonatomic) IBOutlet UILabel *drag4;
    @property (weak,nonatomic) IBOutlet UILabel *drag5;
    @property (weak,nonatomic) IBOutlet UILabel *drag6;

-(IBAction) homePressed;
@end
