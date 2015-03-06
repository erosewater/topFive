//
//  DataSource.h
//  TopFive
//
//  Created by dbk-dev on 3/3/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong) NSMutableArray *mapLocations;
@property (nonatomic, strong) NSArray *myLocations;
@property (nonatomic, strong) MKMapView *mapView;
@property (strong, nonatomic) NSArray *mapItems;
@property (strong, nonatomic) NSMutableArray *searchResults;


-(instancetype)initWithKey:(NSString *)searchString andMapView:(MKMapView *)mapView;
-(NSArray *) findStuffNearMe:(id)sender withKey:(NSString *)searchString andMapView:(MKMapView *)mapView;
-(NSArray *) addItemsToLocations:(MKPointAnnotation *)annotation;


@end
