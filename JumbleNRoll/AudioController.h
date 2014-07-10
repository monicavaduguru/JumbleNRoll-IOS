//
//  AudioController.h
//  JumbleNRoll
//
//  Created by Monica on 5/11/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kSoundbackground @"Music3.mp3"
#define kSoundEtc @"Music1.mp3"

#define kAudioEffectFiles @[kSoundbackground]

@interface AudioController : NSObject
{
    NSMutableDictionary* audio;
}
-(void)play:(NSString*)name;
-(void)preloadAudioEffects:(NSArray*)effectFileNames;
-(void)stop:(NSString*) name;
@end
