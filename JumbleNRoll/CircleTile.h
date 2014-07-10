//
//  CircleTile.h
//  JumbleNRoll
//
//  Created by Monica on 5/8/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleTile : UIImageView
{
    float scale;
}
@property (copy) NSString* letter;

-(instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength;
-(void) addLetter:(NSString*)letter1;
@end
