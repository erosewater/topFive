//
//  Placemark.h
//  TopFive
//
//  Created by dbk-dev on 2/24/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Placemark : MKPlacemark

@property(nonatomic, strong) CLLocation *pmLocation;
@property(nonatomic, readonly, copy) NSString *name;
@property(nonatomic, readonly, copy) NSDictionary *addressDictionary;
@property(nonatomic, readonly, copy) NSString *subLocality;
@property(nonatomic, readonly, copy) NSString *locality;
@property(nonatomic, strong) NSMutableDictionary *mapLocations;
@property (nonatomic, strong) NSMutableArray *mySearchResults;

@property(nonatomic, readonly, copy) NSString *subAdministrativeArea;
@property(nonatomic, readonly, copy) NSString *administrativeArea;


- (instancetype)initWithPlacemark:(CLPlacemark *)placemark;
//- (void)storeLocation:(CLLocation *)location andName:(NSString *)name;
- (void) storeLocationByName:(NSString *)name andLat:(NSNumber *)lat andLng:(NSNumber *)lng;

@end
