//
//  CommonViewController.h
//  JumbleNRoll
//
//  Created by Monica on 5/31/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonViewController : UIViewController
{
CGPoint delta;
CGPoint translation;
NSInteger ballRadius;
NSInteger viewHeight;
NSInteger viewWidth;

NSMutableArray* _xcoor;
NSMutableArray* _ycoor;
NSInteger gap;
    
NSMutableArray* _circles;
NSMutableArray* _tiles;
NSString *word;
NSUInteger wordlen;

NSTimer *timer;
NSTimer *watchTimer;
int numberOfLetter;
int noOfSeconds;
bool gameOver;
    
    
    UIImageView *player;
    IBOutlet UIView *view1;
    IBOutlet UILabel *watch;

    
}

@property (strong) NSMutableArray *wordArray;
@property (assign) long noOfWords;
@property(assign) NSInteger tileSideLength;
@property (assign) NSInteger circleSideLength;
@property (assign) int randNumGenerator;
@property (assign) BOOL move;
@property (copy) NSString *level;

-(IBAction) backPressed;
-(IBAction) homePressed;

-(void)tick:(NSTimer*)timer;
-(void) moveTile;
-(void)stopWatch;
-(void)setSeconds:(int)seconds1;
-(void) getWord;
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
-(void) addRandomTiles;
-(void) addEmptyCircles;
-(void) createScreen;







@end
