//
//  DataSource.m
//  TopFive
//
//  Created by dbk-dev on 3/3/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "DataSource.h"
#import "Placemark.h"

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
        if (response.mapItems == nil )
            NSLog(@"No Matches");
        else if (!response.mapItems)
            NSLog(@"I got no response");
        else
                  
        
            self.mapItems = response.mapItems;
        
             }];
    
    
    
    
    if (self.mapItems != nil) {
    return self.mapItems;
    } else {
        NSArray *mapItems = [[NSArray alloc]initWithObjects:@[@"Name"], nil];
        return mapItems;
    }
     }
     
-(void) storeLocations:(NSString *)name andLat:(NSNumber *)lat andLong:(NSNumber *)lng {
         
         [self.searchResults addObject: @{@"name":name, @"lat": lat, @"lng": lng}];
         
}
     
- (NSArray *) addItemsToLocations:(MKPlacemark *)placemark withLocation:(CLLocation *)userLocation {
    
    self.userLocation = self.mapView.userLocation.location;
    self.searchResults = [[NSMutableArray alloc]init];
    
    for (MKMapItem *item in self.mapItems) {
        
        
        
                    NSNumber *lng = [NSNumber numberWithDouble:item.placemark.location.coordinate.longitude];
                    NSNumber *lat = [NSNumber numberWithDouble:item.placemark.location.coordinate.latitude];
        
        
                    NSLog(@"item lat and lng %f %f", item.placemark.location.coordinate.latitude, item.placemark.location.coordinate.longitude);
        
        
        [self.searchResults addObject: @{@"name": item.name, @"lat": lat, @"lng": lng, @"locality": item.placemark.locality}];
        
        
     // was trying to calculate the distance
        
        NSMutableArray *tempLocations = [[NSMutableArray alloc] init];
       
        //This code should work but doesn't work
        //for (NSInteger idx = 0; idx < self.searchResults.count; idx++) {
       
        
        // This code works, but only gives me what's in index 0 of the array
        //for (NSDictionary *location in self.searchResults[0]) {
        
        // The below code fails - tells me that the item in current index is not an NSDictionary, though it is
        
        for (NSDictionary *location in self.searchResults) {
            NSMutableDictionary *mutableLocation = [[NSMutableDictionary alloc]init];
            [mutableLocation addEntriesFromDictionary:location];
        //    NSLog(@"Lat is %f, location[@"lat"]" doubleValue);
            
            CLLocation *locationToTest = [[CLLocation alloc]initWithLatitude:[location[@"lat"] doubleValue]
                                                                   longitude:[location[@"lng"] doubleValue]];
            double distance = [locationToTest distanceFromLocation:userLocation];
           // NSLog(@"Distance is %f", distance);
           // NSLog(@"Place is %@", location[@"name"]);
        
            [mutableLocation setObject:[NSNumber numberWithDouble:distance] forKey:@"distance"];
            [tempLocations addObject:mutableLocation];
            
            
           // [mutableLocation set O]
            
            NSMutableArray *sortedLocations = [tempLocations mutableCopy];
            
            NSSortDescriptor *distanceDescriptor = [[NSSortDescriptor alloc] initWithKey:@"distance" ascending:YES];
            [sortedLocations sortUsingDescriptors:[NSArray arrayWithObject:distanceDescriptor]];
            

        
            
        
        self.mapLocations = sortedLocations;
        
        
       
        
        }
        

    
    
}
    
    return self.mapLocations;
}
     
    

     
    
         
    

@end
