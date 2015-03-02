//
//  ViewController.m
//  TopFive
//
//  Created by dbk-dev on 2/18/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"
#import "ListTableViewController.h"
#import "Placemark.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.mapView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self.view addSubview:self.mapView];
    self.mapLocations = [[NSMutableArray alloc]init];
    
    [self centerOnUser:self];
   
   // self.userCenterButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   // self.userCenterButton.frame = CGRectMake(20,320,280,40);
   // [self.userCenterButton setTitle:@"center on user"
   //                        forState:UIControlStateNormal];
    [self.userCenterButton addTarget:self
                              action:@selector(centerOnUser:)
                    forControlEvents:UIControlEventTouchUpInside];
    
    [self.showListView addTarget:self
                          action:@selector(showTableView:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.userCenterButton];
    [self.view addSubview:self.showListView];
    
    //   NSMutableArray *lats = [[NSMutableArray alloc] init];
    //   NSMutableArray *lngs = [[NSMutableArray alloc] init];
    
    
    //    for (NSDictionary *location in locations) {
    //        [lats addObject:[NSNumber numberWithDouble:[location[@"lat"] doubleValue]]];
    //        [lngs addObject:[NSNumber numberWithDouble:[location[@"lng"] doubleValue]]];
    //    }
    //    [lats sortUsingSelector:@selector(compare:)];
    //    [lngs sortUsingSelector:@selector(compare:)];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    if(!self.userLocationUpdated) {
        [self.mapView setCenterCoordinate:userLocation.location.coordinate];
        self.userLocationUpdated = YES;
       // self.mapLocations = nil;
        [self findClosestRestaurants:self];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)centerOnUser:(id)sender
{
    
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
  //  CLLocationCoordinate2D myHouse = CLLocationCoordinate2DMake(45.5499120, -122.6490560);
    
    CLLocationDistance regionWidth = 1000;
    CLLocationDistance regionHeight = 1000;
    
    MKCoordinateRegion startRegion = MKCoordinateRegionMakeWithDistance (self.mapView.userLocation.coordinate, regionWidth, regionHeight);
    
    [self.mapView setRegion:startRegion animated:YES];
   
    if (self.mapView.userLocation) {
        [self findClosestRestaurants:self];
    }
   
    
    
}

-(void)createAnnotation:(CLLocationCoordinate2D *)myCoordinate {
    CLLocationCoordinate2D annotationCoordinate = *myCoordinate;
    MyAnnotation *annotation = [[MyAnnotation alloc] init];
    annotation.coordinate = annotationCoordinate;
    
    [self.mapView addAnnotation:annotation];
    
}

- (void)findClosestRestaurants:(id)sender {
    
    MKLocalSearchRequest *request =
    [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = @"Restaurant";
    request.region = _mapView.region;
    
   
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse
                                         *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            
            self.mapItems = response.mapItems;
           // self.mapLocations = nil;
        
        
            for (MKMapItem *item in response.mapItems)
            {
                 
                 NSLog(@"name = %@", item.name);
                
                self.placemark = item.placemark;
              
                 MKPointAnnotation *annotation =
                [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
              
                NSNumber *lng = [NSNumber numberWithDouble:annotation.coordinate.longitude];
                NSNumber *lat = [NSNumber numberWithDouble:annotation.coordinate.latitude];
               
                
               
                
               [self.mapLocations addObject: @[
                                        @{@"name": item.name, @"lat": lat, @"lng": lng}]];
                                     
             
                //annotation.title = item.name;
                
                [self.mapView addAnnotation:annotation];
                

            }
      //  NSMutableDictionary *locDictionary = [self.mapItems[0] mutableCopy];
     //   NSLog(@"placemark is %@", locDictionary[@"placemark"]);
        
        
    }];
}

-(void)showTableView:(id)sender {
    ListTableViewController *listTableVC = [[ListTableViewController alloc] init];
    listTableVC.mapLocations = self.mapLocations;
    listTableVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:listTableVC animated:YES completion:nil];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"annoView"];
    
    if(!view) {
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annoView"];
        
    }
    
    view.image = [UIImage imageNamed:@"1.png"];
    view.canShowCallout = YES;
    return view;
    
    
}





@end
