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
