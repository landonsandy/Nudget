//
//  Goal.m
//  Nudget
//
//  Created by Landon Sandy on 2/2/13.
//  Copyright (c) 2013 Landon Sandy. All rights reserved.
//

#import "Goal.h"

@implementation Goal
@synthesize goal;
@synthesize object;
@synthesize verb;
@synthesize toIncrease;

-(void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeInt:goal forKey:@"goal"];
    [encoder encodeBool:toIncrease forKey:@"purchased"];
    [encoder encodeObject:object];
    [encoder encodeObject:verb];
}

-(id) initWithCoder: (NSCoder *) decoder
{
    self.goal=[decoder decodeIntegerForKey:@"goal"];
    self.toIncrease= [decoder decodeBoolForKey:@"purchased"];
    self.object =[decoder decodeObject];
    self.verb =[decoder decodeObject];
    return self;
}
@end
