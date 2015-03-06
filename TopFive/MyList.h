//
//  MyList.h
//  TopFive
//
//  Created by dbk-dev on 2/27/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyList : NSObject <NSCoding>

@property (strong, nonatomic) NSMutableArray *myLocations;
@property (strong, nonatomic) NSMutableDictionary *myLocationDictionary;

@end
