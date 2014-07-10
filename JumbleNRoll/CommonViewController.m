//
//  CommonViewController.m
//  JumbleNRoll
//
//  Created by Monica on 5/31/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "CommonViewController.h"
#import "SquareTile.h"
#import "CircleTile.h"

@interface CommonViewController ()

@end

@implementation CommonViewController
@synthesize wordArray,tileSideLength,circleSideLength,noOfWords,randNumGenerator,move,level;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//function called when back button is pressed
-(IBAction) backPressed
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)tick:(NSTimer*)timer
{
    noOfSeconds++;
    [self setSeconds:noOfSeconds];
    
    if (gameOver) {
        [self stopWatch];
    }
}

//moves tile
-(void) moveTile
{
    for (SquareTile *square in _tiles){
        
        square.center=CGPointMake(square.center.x+square.posx, square.center.y+square.posy);
        //printf("%f, %f ",square.frame.origin.x,square.frame.origin.y);
        
        if (square.center.x-self.tileSideLength/2<view1.frame.origin.x||square.center.x+self.tileSideLength/2>view1.frame.origin.x+viewWidth)
            square.posx=-square.posx;
        if (square.center.y-self.tileSideLength/2<0||square.center.y+
            self.tileSideLength/2>viewHeight)
            square.posy=-square.posy;
        
    }
}

//stops the watch timer
-(void)stopWatch
{
    [watchTimer invalidate];
    watchTimer = nil;
   
}

-(void)setSeconds:(int)seconds1{
    watch.text = [NSString stringWithFormat:@" %02.f : %02i", round(seconds1 / 60), seconds1 % 60 ];
    
}

-(void) getWord
{
    word=[self.wordArray objectAtIndex:arc4random() % self.noOfWords ];
}


- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Levels"])
    {
        [self backPressed];
    }
    if([title isEqualToString:@"Home"])
    {
        [self homePressed];
        
    }
    
}

-(void) createScreen{
    wordlen=[word length];
    gap=(viewWidth-wordlen*self.circleSideLength)/2;
    //printf("%d %d %d %d",gap,viewWidth,wordlen,circleSideLength);
    [self addEmptyCircles];
    [self addRandomTiles];
    
}

-(void) addEmptyCircles
{
    _circles = [NSMutableArray arrayWithCapacity: wordlen];
    for (int i=0;i<wordlen;i++)
    {
        NSString* letter = [word substringWithRange:NSMakeRange(i, 1)];
        CircleTile *circle=[[CircleTile alloc] initWithLetter:letter andSideLength:self.circleSideLength];
        circle.center = CGPointMake((gap +self.circleSideLength/2+ i*(self.circleSideLength) ), 95);
        [self.view addSubview:circle];
        [_circles addObject:circle];
    }
    
}


-(void) addRandomTiles
{
    _tiles = [NSMutableArray arrayWithCapacity: wordlen];
    
    _xcoor=[NSMutableArray arrayWithCapacity: wordlen];
    _ycoor=[NSMutableArray arrayWithCapacity: wordlen];
    long x=arc4random()%(viewWidth-2*self.tileSideLength-2*ballRadius)+self.tileSideLength+2*ballRadius;
    long y=arc4random()%(viewHeight-2*self.tileSideLength-2*ballRadius)+self.tileSideLength+2*ballRadius;
    //printf("start\n");
    //NSLog(@"%ld", x);
    //NSLog(@"%ld", y);
    for (int i=0;i<wordlen;i++)
    {
        NSString* letter = [word substringWithRange:NSMakeRange(i, 1)];
        
        int found=0;
        while (!found){
            int flag=0;
            
            if (i==0)
                break;
            x=arc4random()%(viewWidth-2*self.tileSideLength-2*ballRadius)+self.tileSideLength+2*ballRadius;
            y=arc4random()%(viewHeight-2*self.tileSideLength-2*ballRadius)+self.tileSideLength+2*ballRadius;
            //NSLog(@"%ld", x);
            //NSLog(@"%ld", y);
            for (int j=i-1; j>=0; j--) {
                //NSLog(@"%d x",[[_xcoor objectAtIndex:j] integerValue]);
                //NSLog(@"%d y",[[_ycoor objectAtIndex:j] integerValue]);
                //NSLog(@"%d diff x",abs([[_xcoor objectAtIndex:j] integerValue]-x));
                //NSLog(@"%d diff y", abs([[_ycoor objectAtIndex:j] integerValue]-y));
                
                
                if ( (abs([[_xcoor objectAtIndex:j] integerValue]-x)<self.tileSideLength) && (abs([[_ycoor objectAtIndex:j] integerValue]-y)< self.tileSideLength)){
                    x=arc4random()%(viewWidth-2*self.tileSideLength-2*ballRadius)+self.tileSideLength+2*ballRadius;
                    y=arc4random()%(viewHeight-2*self.tileSideLength-2*ballRadius)+self.tileSideLength+2*ballRadius;
                    //printf("re enter\n");
                    //NSLog(@"%ld", x);
                    //NSLog(@"%ld", y);
                    flag=1;
                    break;
                }
            }
            if(!flag){
                found=1;
            }
        }
        
        //printf("%d final",i);
        //NSLog(@"%ld", x);
        
        //NSLog(@"%ld", y);
        SquareTile *square=[[SquareTile alloc] initWithLetter:letter andSideLength:self.tileSideLength andNumber:i];
        square.center=CGPointMake(x,y);
        [_xcoor addObject:[NSNumber numberWithInteger:x]];
        [_ycoor addObject:[NSNumber numberWithInteger:y]];
        square.posx=arc4random()%self.randNumGenerator+1;
        square.posy=arc4random()%self.randNumGenerator+1;
        [view1 addSubview:square];
        [_tiles addObject: square];
    }
    
}


-(IBAction) homePressed
{
    
    UIViewController *presenter = self.presentingViewController; // 0 is assuming that ParentViewController is in the first tab. Change if necessary
    [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
    [presenter dismissViewControllerAnimated:(YES) completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
