//
//  MyAnnotation.h
//  TopFive
//
//  Created by dbk-dev on 2/18/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSNumber *top5Position;



@end
