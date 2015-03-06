//
//  Top5Category.h
//  TopFive
//
//  Created by dbk-dev on 3/4/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Top5Category : NSObject <NSCoding>

@property (strong, nonatomic) NSArray *typeOfPlace;
@property (strong, nonatomic) NSArray *placeColors;
@property (strong, nonatomic) UIColor *categoryColor;

@end
