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
#import "DataSource.h"


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
   
    [self.userCenterButton addTarget:self
                              action:@selector(centerOnUser:)
                    forControlEvents:UIControlEventTouchUpInside];
    
    [self.showListView addTarget:self
                          action:@selector(showTableView:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.eatButton addTarget:self
                              action:@selector(findClosestRestaurants:)
                    forControlEvents:UIControlEventTouchUpInside];
    
    [self.drinkButton addTarget:self
                         action:@selector(findClosestBars:)
                    forControlEvents:UIControlEventTouchUpInside];


    
    [self.view addSubview:self.userCenterButton];
    [self.view addSubview:self.showListView];
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    if(!self.userLocationUpdated) {
        [self.mapView setCenterCoordinate:userLocation.location.coordinate];
        self.userLocationUpdated = YES;
       // self.mapLocations = nil;
      //  [self findClosestRestaurants:self];
        
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
   
   // if (self.mapView.userLocation) {
    //    [self findClosestRestaurants:self];
   // }
   
    
    
}

-(void)createAnnotation:(CLLocationCoordinate2D *)myCoordinate {
    CLLocationCoordinate2D annotationCoordinate = *myCoordinate;
    MyAnnotation *annotation = [[MyAnnotation alloc] init];
    annotation.coordinate = annotationCoordinate;
    
    [self.mapView addAnnotation:annotation];
    
}

- (void)findClosestRestaurants:(id)sender {
 //   [self centerOnUser:self];
    
   self.mapItems =  [[DataSource sharedInstance] initWithKey:@"Restaurant" andMapView:self.mapView].mapItems;
   
    for (MKMapItem *item in self.mapItems)
    {
        self.mapLocations =[[DataSource sharedInstance] addItemsToLocations:item.placemark withLocation:self.mapView.userLocation.location];

    }
    if (self.mapLocations != nil) {
    self.closestItems = [[NSMutableArray alloc]initWithObjects:self.mapLocations[0],self.mapLocations[1],self.mapLocations[2], self.mapLocations[3], self.mapLocations[4], nil];
        [self annotateTopFive:self.closestItems];
    }
    
}

-(void) annotateTopFive:(NSArray *)closestLocations {
    
    NSNumber *top1Lat = closestLocations[0][@"lat"];
    NSNumber *top1Lng = closestLocations[0][@"lng"];
    NSNumber *top2Lat = closestLocations[1][@"lat"];
    NSNumber *top2Lng = closestLocations[1][@"lng"];
    NSNumber *top3Lat = closestLocations[2][@"lat"];
    NSNumber *top3Lng = closestLocations[2][@"lng"];
    NSNumber *top4Lat = closestLocations[3][@"lat"];
    NSNumber *top4Lng = closestLocations[3][@"lng"];
    NSNumber *top5Lat = closestLocations[4][@"lat"];
    NSNumber *top5Lng = closestLocations[4][@"lng"];

    
    
    double top1LatDouble = [top1Lat doubleValue];
    double top1LngDouble = [top1Lng doubleValue];
    double top2LatDouble = [top2Lat doubleValue];
    double top2LngDouble = [top2Lng doubleValue];
    double top3LatDouble = [top3Lat doubleValue];
    double top3LngDouble = [top3Lng doubleValue];
    double top4LatDouble = [top4Lat doubleValue];
    double top4LngDouble = [top4Lng doubleValue];
    double top5LatDouble = [top5Lat doubleValue];
    double top5LngDouble = [top5Lng doubleValue];
    
        MKPointAnnotation *annotation =
      [[MKPointAnnotation alloc]init];
    
     CLLocationCoordinate2D topCoor1 = CLLocationCoordinate2DMake(top1LatDouble, top1LngDouble );
     CLLocationCoordinate2D topCoor2 = CLLocationCoordinate2DMake(top2LatDouble, top2LngDouble );
     CLLocationCoordinate2D topCoor3 = CLLocationCoordinate2DMake(top3LatDouble, top3LngDouble );
     CLLocationCoordinate2D topCoor4 = CLLocationCoordinate2DMake(top4LatDouble, top4LngDouble );
     CLLocationCoordinate2D topCoor5 = CLLocationCoordinate2DMake(top5LatDouble, top5LngDouble );
    
    
    annotation.coordinate = topCoor1;
    [self.mapView addAnnotation:annotation];
    annotation.coordinate = topCoor2;
    [self.mapView addAnnotation:annotation];
    annotation.coordinate = topCoor3;
    [self.mapView addAnnotation:annotation];
    annotation.coordinate = topCoor4;
    [self.mapView addAnnotation:annotation];
    annotation.coordinate = topCoor5;
    [self.mapView addAnnotation:annotation];

    

    

    
    
    
        
    
        
        
        
       
    }
    
    
    


- (void)findClosestBars:(id)sender {
    
//    [self centerOnUser
    
     self.mapItems = [[DataSource sharedInstance] initWithKey:@"Bar" andMapView:self.mapView].mapItems;
    
    for (MKMapItem *item in self.mapItems)
    {
        self.mapLocations =[[DataSource sharedInstance] addItemsToLocations:item.placemark withLocation:self.mapView.userLocation.location];
        NSLog(@"name = %@", item.name);

        //    self.placemark = item.placemark;
       
        // I left off here - here's my thought - first add the stuff to the array, and then get the array back, and iterate through the array to create the annotations.
        MKPointAnnotation *annotation =
        [[MKPointAnnotation alloc]init];
        annotation.coordinate = item.placemark.coordinate;
        
        
       
        
        
        
        
        // if
        
        
        [self.mapView addAnnotation:annotation];
    }
    
    
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
