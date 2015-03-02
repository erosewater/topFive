//
//  ListTableViewController.h
//  TopFive
//
//  Created by dbk-dev on 2/27/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
//#import <Foundation/Foundation.h>


@interface ListTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *mapLocations;
@property (strong, nonatomic) CLLocation *userLocation;

- (void)goBack:(id)sender;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section;

@end
