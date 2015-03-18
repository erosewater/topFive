//
//  Placemark.m
//  TopFive
//
//  Created by dbk-dev on 2/24/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "Placemark.h"
#import "DataSource.h"

@implementation Placemark


- (instancetype)initWithPlacemark:(CLPlacemark *)placemark {
    if (placemark.location != nil) {
    
    NSNumber *lng = [NSNumber numberWithDouble:placemark.location.coordinate.longitude];
    NSNumber *lat = [NSNumber numberWithDouble:placemark.location.coordinate.latitude];
    NSString *name = placemark.name;
    
   // [[DataSource sharedInstance] storeLocations:name andLat:lat andLong:lng];
        
        [self storeLocationByName:name andLat:lat andLng:lng];
    }
    
    return self;
    
  //  [self.searchResults addObject: @{@"name": item.name, @"lat": lat, @"lng": lng}];
    

    
    
    
    
}

- (void) storeLocationByName:(NSString *)name andLat:(NSNumber *)lat andLng:(NSNumber *)lng {
    
    NSLog(@"name is %@", name);
    
    [self.mySearchResults addObject: @{@"name": name, @"lat": lat, @"lng": lng}];
}

- (void)reverseGeocodeLocation:(CLLocation *)location
{
    CLGeocoder* reverseGeocoder = [[CLGeocoder alloc] init];
    if (reverseGeocoder) {
        [reverseGeocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            CLPlacemark* placemark = [placemarks firstObject];
            if (placemark) {
                //Using blocks, get zip code
                
            }
        }];
    }else{
      
    
    }

}

// This is a deprecated class, need to fix:
//- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
//{
    //Get zip code
   // NSString zipCode = [placemark.addressDictionary objectForKey:(NSString*)kABPersonAddressZIPKey];
//}
    
    
    
    


@end
