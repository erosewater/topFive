//
//  Top5Category.m
//  TopFive
//
//  Created by dbk-dev on 3/4/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "Top5Category.h"

@implementation Top5Category


- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        self.typeOfPlace = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(typeOfPlace))];
        self.placeColors = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(placeColors))];
        self.categoryColor = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(categoryColor))];
      
    }
    
    return self;
}


- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.typeOfPlace forKey:NSStringFromSelector(@selector(typeOfPlace))];
    [aCoder encodeObject:self.placeColors forKey:NSStringFromSelector(@selector(placeColors))];
    [aCoder encodeObject:self.categoryColor forKey:NSStringFromSelector(@selector(categoryColor))];
    
}

@end
