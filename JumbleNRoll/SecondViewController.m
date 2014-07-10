//
//  SecondViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/11/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "SecondViewController.h"
#import "CircleTile.h"
#import "SquareTile.h"
#import "Times.h"

//controller for drag mode
@interface SecondViewController ()

@end

@implementation SecondViewController

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
    CGSize size = view1.bounds.size;
    viewWidth = size.width;
    viewHeight = size.height;
    ballRadius=self.circleSideLength/2;
    numberOfLetter=0;
    noOfSeconds=0;
    moveFlag=NO;
    //printf("%f, %f \n",view1.frame.origin.x,view1.frame.origin.y);
    //printf("%d, %d \n",viewHeight,viewWidth);
    [view1 setBackgroundColor:[UIColor clearColor]];
    [self setSeconds:noOfSeconds];
    [self getWord];

    //UIImage *myImage = [UIImage imageNamed:@"ball1.png" ];
    
    //player = [[UIImageView alloc] initWithImage:myImage];
    //[player setFrame:CGRectMake(0, 0, 2*ballRadius, 2*ballRadius)];

    //[view1 addSubview:player];
    
   
    
    //buttonsView.frame = CGRectMake(
    //                          self.view.frame.size.width - buttonsView.frame.size.width,
    //                        self.view.frame.size.height - buttonsView.frame.size.height,
    //                      buttonsView.frame.size.width,
    //                    buttonsView.frame.size.height );
    
   
    
    
}
// creates the player and adds to the view
-(void) createPlayer
{
    
    player =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 2*ballRadius, 2*ballRadius)];
    player.image = [UIImage imageNamed:@"ball1.png"];
    [view1 addSubview:player];
}

//Function called when start is pressed
-(void) startPressed
{
    [self createPlayer];

    gameOver=NO;
    watchTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(tick:)
                                                userInfo:nil
                                                 repeats:YES];
    [start setHidden:YES];
    
    [self createScreen];
    
    random=[NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:nil repeats:YES ];
    
}


//function associated with random timer
-(void) onTimer
{
    [self checkCollision];
    if (self.move) {
        [self moveTile];
    }
    
}


//Checks for collision between ball and tiles
-(void) checkCollision
{
    //NSLog(@" self.detectrect.frame.origin.x : %f ",_ballView.weakSelf.center.y);
    //NSLog(@" self.detectrect.frame.origin.y : %f ", _ballView.weakSelf.center.y);
    
    SquareTile *square1=nil;
    @synchronized(_tiles){
    
    for (SquareTile *square in _tiles)
    {
        {
            
            if(CGRectIntersectsRect(player.frame, square.frame))
            {
                
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

//Checks if all tiles/letters of the word are collected
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
            if (noOfSeconds+1<a){
                [besttimes.times setValue: [NSString stringWithFormat:@"%d seconds", noOfSeconds+1] forKey:self.level];
                UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"!!!! WOOHOO BEST TIME !!!!"
                                                                 message:[NSString stringWithFormat:@"Time:%d seconds",(noOfSeconds+1)]
                                                                delegate:self
                                                       cancelButtonTitle:nil
                                       
                                                       otherButtonTitles:@"Home",@"Levels" , nil];
                
                [alert1 show];
            }
            else
            {
            UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"!!!! WOOHOO you got it right !!!!"
                                                             message:[NSString stringWithFormat:@"Time:%d seconds",(noOfSeconds+1)]
                                                            delegate:self
                                                   cancelButtonTitle:nil
                                   
                                                   otherButtonTitles:@"Home",@"Levels" , nil];
            
            [alert1 show];
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
        
        
    }
}

//Start of touch event
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch=[[event allTouches] anyObject];
    CGPoint touch=[myTouch locationInView:view1];
    if(CGRectContainsPoint(player.frame, touch))
    {
        moveFlag=YES;
    }
    else
    {
        moveFlag=NO;
    }
}

//Function handling movement of touch
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *) event{
    UITouch *myTouch=[[event allTouches] anyObject];
    CGPoint touch=[myTouch locationInView:view1];
    if(moveFlag)
    //if ([myTouch view] == player)
    //if(CGRectIntersectsRect(myTouch.view.bounds,player.frame))
    {
    //printf("1  %f %f\n",touch.x,touch.y);

    //printf("2  %f %f\n",playerOrigin.x,playerOrigin.y);
    
    //0.000000 0.000000
    //0.000000 131.000000
    CGRect screen2=view1.frame;
    //printf("4   %f %f\n",screen2.origin.x,screen2.origin.y);
    
    if(touch.x-ballRadius <0 )
        touch.x=ballRadius;
    if(touch.y-ballRadius < 0)
        touch.y = ballRadius;
    
    if(touch.x+ballRadius>screen2.size.width)
        touch.x=screen2.size.width-ballRadius;
    if(touch.y+ballRadius>screen2.size.height)
        touch.y=screen2.size.height-ballRadius;
    
    
    //if(f.origin.x > (screen.size.width - f.size.width))
      //  f.origin.x = (screen.size.width - f.size.width);
    //if(f.origin.y > (screen.size.height - f.size.height))
      //  f.origin.y = (screen.size.height - f.size.height);
    player.center=CGPointMake(touch.x, touch.y);
    }
}

//Function called when touch ends
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    moveFlag=NO;
}
//Function called when touch is cancelled

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    moveFlag=NO;
}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

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
