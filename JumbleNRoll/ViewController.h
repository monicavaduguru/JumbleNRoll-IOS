//
//  ViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIButton *music;
    BOOL playMusic;
}

- (IBAction) firstClicked;
- (IBAction) instructionsClicked;
-(IBAction) secondClicked;
-(IBAction) musicClicked;


@end

