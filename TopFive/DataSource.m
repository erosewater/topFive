//
//  DataSource.m
//  TopFive
//
//  Created by dbk-dev on 3/3/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype) initWithKey:(NSString *)searchString andMapView:(MKMapView *)mapView {
    self = [super init];
    self.mapView = mapView;
   
    [self findStuffNearMe:self withKey:searchString andMapView:mapView];
    
    return self;
    
    
};

- (NSArray *) findStuffNearMe:(id)sender withKey:(NSString *)searchString andMapView:(MKMapView *)mapView {
    
    
    MKLocalSearchRequest *request =
    [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchString;
    request.region = _mapView.region;
    
    
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse
                                         *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            
            self.mapItems = response.mapItems;
        
        
        
        
            
        }
        //  NSMutableDictionary *locDictionary = [self.mapItems[0] mutableCopy];
        //   NSLog(@"placemark is %@", locDictionary[@"placemark"]);
        
        
    ];
    return self.mapItems;
}

- (NSArray *) addItemsToLocations:(MKPointAnnotation *)annotation withLocation:(CLLocation *)userLocation {
    self.searchResults = [[NSMutableArray alloc]init];
    
    for (MKMapItem *item in self.mapItems) {
              
                    NSNumber *lng = [NSNumber numberWithDouble:annotation.coordinate.longitude];
                    NSNumber *lat = [NSNumber numberWithDouble:annotation.coordinate.latitude];
       
        
        
                    [self.searchResults addObject: @[
                                                    @{@"name": item.name, @"lat": lat, @"lng": lng}]];
        
        NSMutableDictionary *mutableLocation = [[NSMutableDictionary alloc]init];
     // was trying to calculate the distance
        
        NSMutableArray *tempLocations = [[NSMutableArray alloc] init];
       
        //This code should work but doesn't work
        //for (NSInteger idx = 0; idx < self.searchResults.count; idx++) {
       
        
        // This code works, but only gives me what's in index 0 of the array
        //for (NSDictionary *location in self.searchResults[0]) {
        
        // The below code fails - tells me that the item in current index is not an NSDictionary, though it is
        
        for (NSDictionary *location in self.searchResults) {
            [mutableLocation addEntriesFromDictionary:location];
            
            CLLocation *locationToTest = [[CLLocation alloc]initWithLatitude:[location[@"lat"] doubleValue]
                                                                   longitude:[location[@"lng"] doubleValue]];
            double distance = [locationToTest distanceFromLocation:userLocation];
            [mutableLocation setObject:[NSNumber numberWithDouble:distance] forKey:@"distance"];
            [tempLocations addObject:mutableLocation];
            
           // [mutableLocation set O]
        
             }
      //  self.mapLocations = [[NSArray alloc] initWithArray:tempLocations];
       //self.mapLocations = self.searchResults;
        
        
        

    
    
}
    return self.mapLocations;
}


@end
