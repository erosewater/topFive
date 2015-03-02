//
//  Placemark.h
//  TopFive
//
//  Created by dbk-dev on 2/24/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Placemark : MKPlacemark

@property(nonatomic, readonly, copy) CLLocation *location;
@property(nonatomic, readonly, copy) NSString *name;
@property(nonatomic, readonly, copy) NSDictionary *addressDictionary;
@property(nonatomic, readonly, copy) NSString *subLocality;
@property(nonatomic, readonly, copy) NSString *locality;
@property(nonatomic, strong) NSMutableDictionary *mapLocations;


- (instancetype)initWithPlacemark:(CLPlacemark *)placemark;
- (void)storeLocation:(CLLocation *)location andName:(NSString *)name;


@end
