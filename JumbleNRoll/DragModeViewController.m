//
//  DragModeViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/20/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "DragModeViewController.h"
#import "SecondViewController.h"
// Controller for options of drag mode
@interface DragModeViewController ()

@end

@implementation DragModeViewController
@synthesize motion;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    motion=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//set attributes of game for word with 3 letters

-(IBAction) threePressed
{
    UIStoryboard *storyboard = [self storyboard];
    
    SecondViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    secondViewController.wordArray = [NSMutableArray arrayWithObjects: @"try", @"fry", @"her", @"van",@"cow", @"win", @"pet", @"con",@"pun", @"fin", @"she", @"nor",@"old", @"fun", @"kit", @"him",@"far", @"new", @"flu", @"fog",@"guy", @"gym", @"hut", @"ice",@"irk", @"joy", @"jug", @"keg",@"lid", @"lip", @"log", @"mew",@"mow", @"oar", @"pen", @"oaf",@"pug", @"red", @"rib", @"rug", nil];
    
    secondViewController.tileSideLength=60;
    secondViewController.circleSideLength=40;
    
    secondViewController.randNumGenerator=6;
    secondViewController.move=motion;
    secondViewController.level=@"drag3";

    
    [self presentViewController:secondViewController animated:(YES) completion:nil];
    
}

//Control motion of tiles
-(IBAction) switchChanged:(UISwitch *)sender
{
    if ([sender isOn]){
        motion=YES;
        printf("%d",motion);
    }
    else
    {
        motion=NO;
        printf("%d",motion);

    }
}

//set attributes of game for word with 4 letters

-(IBAction) fourPressed
{
    UIStoryboard *storyboard = [self storyboard];
    
    SecondViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    secondViewController.wordArray = [NSMutableArray arrayWithObjects: @"acid", @"band", @"pair", @"ribs",@"cabs", @"mild", @"rune", @"dark",@"ping", @"long", @"full", @"talk",@"pong", @"tell", @"tall", @"pair",@"farm", @"tree", @"mole", @"pair",@"film", @"film", @"pond", @"next",@"well", @"text", @"tint", @"fold",@"pend", @"rake", @"kill", @"hell",@"ruin", @"torn", @"hone", @"mine",@"pill", @"wise", @"fine", @"true", nil];
    
    secondViewController.tileSideLength=50;
    secondViewController.circleSideLength=40;
    
    secondViewController.randNumGenerator=5;
    secondViewController.move=motion;
    secondViewController.level=@"drag4";

    
    [self presentViewController:secondViewController animated:(YES) completion:nil];

    
}

//set attributes of game for word with 5 letters

-(IBAction) fivePressed
{
    UIStoryboard *storyboard = [self storyboard];
    
    SecondViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    secondViewController.wordArray = [NSMutableArray arrayWithObjects: @"afoot", @"acute", @"audit", @"bands",@"barge", @"began", @"blurt", @"bleak",@"blind", @"catch", @"carry", @"caste",@"civic", @"clamp", @"cling", @"disco",@"droop", @"dwell", @"giant", @"grunt",@"judge", @"jolly", @"kneel", @"logic",@"madam", @"myths", @"nerdy", @"owing",@"prawn", @"press", @"prone", @"prowl",@"rhyme", @"sheep", @"sneer", @"thumb",@"today", @"value", @"valve", @"villa", nil];
    
    secondViewController.tileSideLength=45;
    secondViewController.circleSideLength=40;
    
    secondViewController.randNumGenerator=4;
    secondViewController.move=motion;
    secondViewController.level=@"drag5";

    
    [self presentViewController:secondViewController animated:(YES) completion:nil];
    
    
}

//set attributes of game for word with 6 letters

-(IBAction) sixPressed
{
    UIStoryboard *storyboard = [self storyboard];
    
    SecondViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    secondViewController.wordArray = [NSMutableArray arrayWithObjects: @"adjoin", @"advice", @"arctic", @"amazed",@"arcade", @"barrel", @"bitter", @"bitten",@"booked", @"brains", @"cancel", @"agency",@"amoeba", @"direct", @"hairdo", @"hallow",@"happen", @"inhale", @"intend", @"career",@"castle", @"chilli", @"chorus", @"choose",@"copper", @"driver", @"larger", @"mirror",@"nutmeg", @"outwit", @"poison", @"radian",@"record", @"repair", @"roughly", @"skinny",@"sloppy", @"socket", @"teflon", @"vacant", nil];
    
    secondViewController.tileSideLength=45;
    secondViewController.circleSideLength=40;
    
    secondViewController.randNumGenerator=3;
    secondViewController.move=motion;
    secondViewController.level=@"drag6";

    
    [self presentViewController:secondViewController animated:(YES) completion:nil];
    
}

//function called when home button is pressed
-(IBAction) homePressed
{
    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    
}

//ensures no autorotation
- (BOOL)shouldAutorotate
{
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
