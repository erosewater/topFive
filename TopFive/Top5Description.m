//
//  Top5Description.m
//  TopFive
//
//  Created by dbk-dev on 3/6/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "Top5Description.h"

@implementation Top5Description


- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.placeDescriptor = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(placeDescriptor))];
        
    }
    
    return self;
}


- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.placeDescriptor forKey:NSStringFromSelector(@selector(placeDescriptor))];
   
}

@end
