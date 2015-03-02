//
//  Placemark.m
//  TopFive
//
//  Created by dbk-dev on 2/24/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "Placemark.h"

@implementation Placemark


- (instancetype)initWithPlacemark:(CLPlacemark *)placemark {
return self;
    
}

-(void)storeLocationAndName:(CLLocation *)location  andName:(NSString *)name  {
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
        MKReverseGeocoder* rev = [[MKReverseGeocoder alloc] initWithCoordinate:location.coordinate];
        rev.delegate = self;
        
        //using delegate
        [rev start];
        //[rev release]; release when appropriate
    }
    //[reverseGeocoder release];release when appropriate
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    //Get zip code
   // NSString zipCode = [placemark.addressDictionary objectForKey:(NSString*)kABPersonAddressZIPKey];
}
    
    
    
    


@end
