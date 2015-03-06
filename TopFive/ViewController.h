//
//  ViewController.h
//  TopFive
//
//  Created by dbk-dev on 2/18/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController : UIViewController <MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property BOOL userLocationUpdated;
@property (strong, nonatomic) IBOutlet UIButton *userCenterButton;
@property (strong, nonatomic) NSDictionary *itemAddressDictionary;
@property (strong, nonatomic) NSMutableDictionary *itemDictionary;
@property (strong, nonatomic) NSMutableArray *closestItems;
@property (strong, nonatomic) MKPlacemark *placemark;
@property (strong, nonatomic) NSArray *mapItems;
@property (strong, nonatomic) NSArray *mapLocations;
@property (strong, nonatomic) IBOutlet UIButton *showListView;
@property (strong, nonatomic) IBOutlet UIButton *eatButton;
@property (strong, nonatomic) IBOutlet UIButton *drinkButton;

-(void)showTableView:(id)sender;







@end

