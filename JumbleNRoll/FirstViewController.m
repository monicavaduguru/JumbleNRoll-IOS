//
//  FirstViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//


#import "FirstViewController.h"
#import "CircleTile.h"
#import "SquareTile.h"
#import "Times.h"
#import "RollModeViewController.h"

//View controller for the roll mode
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize imageView=_imageView;
@synthesize ballView = _ballView;

@synthesize button = _button;
@synthesize label = _label;

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
    
    self.noOfWords=[self.wordArray count];
    numberOfLetter=0;
    noOfSeconds=0;
    [self setSeconds:noOfSeconds];
    ballRadius=self.circleSideLength/2;
    CGSize size = view1.bounds.size;
    viewWidth = size.width;
    viewHeight = size.height;
    [self getWord];
    //buttonsView.frame = CGRectMake(
         //                          self.view.frame.size.width - buttonsView.frame.size.width,
           //                        self.view.frame.size.height - buttonsView.frame.size.height,
             //                      buttonsView.frame.size.width,
               //                    buttonsView.frame.size.height );
    
    CGRect ballViewFrame = CGRectMake(0, 0, 2*ballRadius, 2*ballRadius);
    _ballView = [[BallView alloc] initWithFrame:ballViewFrame];
    [view1 addSubview:_ballView];
    _ballView.delegate = self;
    
    _imageView = [[UIImageView alloc] initWithFrame:ballViewFrame];
    _imageView.image = [UIImage imageNamed:@"ball1.png"];
    [_ballView addSubview:_imageView];
    
    
}
//function called when start button is pressed
-(void) startPressed
{
    gameOver=NO;
    watchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                              target:self
                                            selector:@selector(tick:)
                                            userInfo:nil
                                             repeats:YES];
    [start setHidden:YES];
    [_ballView startUpdateAccelerometer];
    [self createScreen];

    random=[NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:nil repeats:YES ];
}

//Function associated with random timer
-(void) onTimer
{
    [self checkCollision];
    if (self.move) {
        [self moveTile];
    }
    
}


//checks for collision of the ball and the tiles
-(void) checkCollision
{
    //NSLog(@" self.detectrect.frame.origin.x : %f ",_ballView.weakSelf.center.y);
    //NSLog(@" self.detectrect.frame.origin.y : %f ", _ballView.weakSelf.center.y);
    
    SquareTile *square1;
    @synchronized(_tiles){
    for (SquareTile *square in _tiles) {
    {
        if(CGRectIntersectsRect(_ballView.weakSelf.frame, square.frame)){
        
            [square removeFromSuperview];
          
            
            square1=square;
            [[_circles objectAtIndex:numberOfLetter] addLetter:square.letter];
            numberOfLetter++;
            [self checkFinish];
            break;
            }
        }
    }
    [_tiles removeObject:square1];
    }
}

// checks if all the tiles/letters have been collected
-(void) checkFinish{
    if (numberOfLetter==wordlen) {
        gameOver=YES;
        int check=0;
        for (int i=0;i<wordlen;i++)
        {
            //NSLog(@"%@",[[_circles objectAtIndex:i] letter]);
            //NSLog(@"%@",[word substringWithRange:NSMakeRange(i, 1)]);
            if ([[[_circles objectAtIndex:i] letter] isEqualToString:[word substringWithRange:NSMakeRange(i, 1)]]){
                check++;
            }
        }
        if (check==wordlen){
            //printf("you won");
            NSInteger a=[[besttimes.times objectForKey:self.level ] integerValue];
            if (noOfSeconds+1<a)
            {
                [besttimes.times setValue: [NSString stringWithFormat:@"%d seconds", noOfSeconds+1] forKey:self.level];
                UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"!!!! WOOHOO BEST TIME !!!!"
                                                                 message:[NSString stringWithFormat:@"Time:%d seconds",(noOfSeconds+1)]
                                                                delegate:self
                                                       cancelButtonTitle:nil
                                       
                                                       otherButtonTitles:@"Home",@"Levels" , nil];
                [alert1 show];
                [_ballView stopUpdate];
            }
            else{
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"!!!! WOOHOO you got it right !!!!"
                                                             message:[NSString stringWithFormat:@"Time:%d seconds",(noOfSeconds+1)]
                                                            delegate:self
                                                   cancelButtonTitle:nil

                                                   otherButtonTitles:@"Home",@"Levels" , nil];
            [alert1 show];
            [_ballView stopUpdate];
            }
            
        }
        
        else
        {
            //printf("you lost %d", check);
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"!!!! Wrong word formed :( !!!!"
                                                             message:[NSString stringWithFormat:@"Correct word:%@ ",(word)]
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                   
                                                   otherButtonTitles:@"Home",@"Levels" , nil];

            [alert2 show];
            
        }
        
        [_ballView stopUpdate];
        
    }
    

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//ensures no autorotation
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





-(void) viewWillDisappear:(BOOL)animated
{
    [watchTimer invalidate];
    [random invalidate];
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
