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

- (NSArray *) addItemsToLocations:(MKPointAnnotation *)annotation {
    self.searchResults = [[NSMutableArray alloc]init];
    
    for (MKMapItem *item in self.mapItems) {
              
                    NSNumber *lng = [NSNumber numberWithDouble:annotation.coordinate.longitude];
                    NSNumber *lat = [NSNumber numberWithDouble:annotation.coordinate.latitude];

        
                    [self.searchResults addObject: @[
                                                    @{@"name": item.name, @"lat": lat, @"lng": lng}]];
        
        self.mapLocations = self.searchResults;
        
        
        

    
    
}
    return self.mapLocations;
}


@end
