//
//  ViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "ViewController.h"
#import "AudioController.h"
#import "Audio.h"
#import "ViewController.h"
#import "InstructionsViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "RollModeViewController.h"
#import "DragModeViewController.h"
#import "Times.h"
#import "BestTimesControllerViewController.h"

//Home screen controller
@interface ViewController ()

@end

@implementation ViewController

//Code that takes place when the view loads
- (void)viewDidLoad
{
    /*for (id key in besttimes.times) {
        NSLog(@"key: %@   value:%@", key, [besttimes.times objectForKey:key]);
    }*/
    
    playMusic=YES;
    [audio play: kSoundbackground];
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Wood1.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
	// Do any additional setup after loading the view, typically from a nib.
}

//function that controls the music as per button press
-(IBAction) musicClicked
{
    if (playMusic)
    {
        playMusic=NO;
        [audio stop: kSoundbackground];
        [music setTitle:@"Music on" forState:UIControlStateNormal];
    }
    else {
        playMusic=YES;
        [audio play: kSoundbackground];
        [music setTitle:@"Music off" forState:UIControlStateNormal];

    }
}

//Function called when instructions button is clicked
-(IBAction) instructionsClicked
{
    UIStoryboard *storyboard = [self storyboard];
    
    InstructionsViewController *instructionsViewController = [storyboard instantiateViewControllerWithIdentifier:@"instructions"];
    
    [self presentViewController:instructionsViewController animated:(YES) completion:nil];
    
}
//Function called when best times button is clicked

-(IBAction) bestTimesClicked
{
    UIStoryboard *storyboard = [self storyboard];
    
    BestTimesControllerViewController *bestTimesViewController = [storyboard instantiateViewControllerWithIdentifier:@"besttimes"];
    
    [self presentViewController:bestTimesViewController animated:(YES) completion:nil];
    
}

//Function called when roll mode button is clicked

-(IBAction) firstClicked
{
    UIStoryboard *storyboard = [self storyboard];
    
    RollModeViewController *rollViewController = [storyboard instantiateViewControllerWithIdentifier:@"roll"];
    
    [self presentViewController:rollViewController animated:(YES) completion:nil];
    
}

//Function called when drag mode button is clicked

-(IBAction) secondClicked
{
    UIStoryboard *storyboard = [self storyboard];
    
    DragModeViewController *dragViewController = [storyboard instantiateViewControllerWithIdentifier:@"drag"];
    
    [self presentViewController:dragViewController animated:(YES) completion:nil];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//ensures no rotations
- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
