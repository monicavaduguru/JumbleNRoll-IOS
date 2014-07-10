//
//  BestTimes.m
//  JumbleNRoll
//
//  Created by Monica on 5/30/14.
//  Copyright (c) 2014 Monica. All rights reserved.
//

#import "BestTimes.h"
//Model for best times
@implementation BestTimes
@synthesize times;
- (id) init
{
    
    if (self = [super init]) {
        
         NSString *filename = [self savedFilename];
        [[NSFileManager defaultManager] fileExistsAtPath:filename];
        //NSLog(a ? @"Yes" : @"No");
        //printf("In best times");
        if (! [[NSFileManager defaultManager]
               fileExistsAtPath:filename])
        {
            NSArray *keys = [[NSArray alloc] initWithObjects:@"roll3", @"roll4", @"roll5", @"roll6",@"drag3", @"drag4", @"drag5", @"drag6" ,nil];
            NSArray *objs = [[NSArray alloc] initWithObjects:@"1000", @"1000", @"1000",@"1000",@"1000", @"1000", @"1000",@"1000", nil];
            NSDictionary *time = [[NSDictionary alloc] initWithObjects:objs forKeys:keys];
            times=[NSMutableDictionary dictionaryWithDictionary:time];
            //for (id key in times) {
              //  NSLog(@"key: %@   value:%@", key, [times objectForKey:key]);
            //}
        }
        else{
        NSDictionary *time = [[NSDictionary alloc] initWithContentsOfFile:filename];
        
        times = [[NSMutableDictionary alloc ] initWithDictionary:time];
        }
        
    }
    return self;
}

//get saved filename
- (NSString *) savedFilename
{
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filename =
    [documentsDirectory
     stringByAppendingPathComponent:
     @"saved.plist"];
    
    return filename;
}



- (id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        times = [aDecoder decodeObjectForKey:@"times"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:times forKey:@"times"];
}
// save the persistant data
- (void) savePersistentData
{
    NSString *filename = [self savedFilename];
    
    NSLog(@"Writing clown data to %@", filename);
    [times writeToFile:filename atomically:YES];
}

@end
