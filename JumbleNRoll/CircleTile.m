//
//  CircleTile.m
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "CircleTile.h"
//To display the collected letters on top of the game screen
@implementation CircleTile
@synthesize letter;

- (id)initWithFrame:(CGRect)frame
{
    NSAssert(NO, @"Use initWithLetter:andSideLength instead");
    return nil;
}

//create a new circle tile, store what letter should it match to
-(instancetype)initWithLetter:(NSString*)letter1 andSideLength:(float)sideLength
{
    UIImage* img = [UIImage imageNamed:@"circle.png"];
    self = [super initWithImage: img];
    
    if (self != nil) {
        //initialization
        
        scale = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        //add a letter on top
    }
    return self;
}
//add the letter on the tile
-(void) addLetter:(NSString*)letter1{
    letter=letter1;
    UILabel* lblChar = [[UILabel alloc] initWithFrame:self.bounds];
    lblChar.textAlignment = NSTextAlignmentCenter;
    lblChar.textColor = [UIColor blackColor];
    lblChar.backgroundColor = [UIColor clearColor];
    lblChar.text = [letter1 uppercaseString];
    lblChar.font = [UIFont fontWithName:@"Verdana-Bold" size:78.0*scale];
    [self addSubview: lblChar];
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
