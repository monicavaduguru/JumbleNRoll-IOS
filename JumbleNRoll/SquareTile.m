//
//  SquareTile.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.

#import "SquareTile.h"

@implementation SquareTile
@synthesize letterNum,posx,posy;


- (id)initWithFrame:(CGRect)frame
{
    NSAssert(NO, @"Use initWithLetter:andSideLength instead");
    return nil;
}

//create a new square time, store what letter should it match to
-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength andNumber:(int) number
{
    UIImage* img = [UIImage imageNamed:@"square.png"];
    self = [super initWithImage: img];
    
    if (self != nil) {
        //initialization
        
        float scale = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        _letter = letter;
        letterNum=number;
        //add a letter on top
        UILabel* lblChar = [[UILabel alloc] initWithFrame:self.bounds];
        lblChar.textAlignment = NSTextAlignmentCenter;
        lblChar.textColor = [UIColor blackColor];
        lblChar.backgroundColor = [UIColor clearColor];
        lblChar.text = [letter uppercaseString];
        lblChar.font = [UIFont fontWithName:@"Verdana-Bold" size:150.0*scale];
        [self addSubview: lblChar];
    }
    return self;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
