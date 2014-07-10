//
//  SquareTile.h
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SquareTile : UIImageView
@property (strong, nonatomic, readonly) NSString* letter;
@property( assign) int letterNum;
@property(assign) int posx;
@property(assign) int posy;



-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength andNumber:(int) number;
@end
