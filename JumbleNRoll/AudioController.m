//
//  AudioController.m
//  JumbleNRoll
//
//  Created by Monica on 5/11/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "AudioController.h"
#import <AVFoundation/AVFoundation.h>
//Controller for playing audio
@implementation AudioController
//preloads the audio files
-(void)preloadAudioEffects:(NSArray*)effects
{
    audio = [NSMutableDictionary dictionaryWithCapacity: effects.count];
    
    for (NSString* effect in effects) {
        
        NSString* soundPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: effect];
        NSURL* soundURL = [NSURL fileURLWithPath: soundPath];
        
        NSError* loadError = nil;
        AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error: &loadError];
        NSAssert(loadError==nil, @"load sound failed");
        
        player.numberOfLoops = 0;
        [player prepareToPlay];
        
        audio[effect] = player;
    }
}
//plays the audio
-(void)play:(NSString*)name
{
    NSAssert(audio[name], @"effect not found");
    
    AVAudioPlayer* player = (AVAudioPlayer*)audio[name];
    player.numberOfLoops = -1;
    if (player.isPlaying) {
        player.currentTime = 0;
    } else {
        [player play];
    }
}
//stops audio
-(void)stop:(NSString*)name
{
    NSAssert(audio[name], @"effect not found");

    AVAudioPlayer* player = (AVAudioPlayer*)audio[name];
    if (player.isPlaying)
        [player stop];
}


@end
