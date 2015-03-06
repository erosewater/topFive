//
//  Top5TableViewCell.h
//  TopFive
//
//  Created by dbk-dev on 3/4/15.
//  Copyright (c) 2015 RosewaterLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Top5TableViewCell;

@protocol Top5TableViewCellDelegate <NSObject>

- (void) cell:(Top5TableViewCell *)cell didTapLocalPlace:(UILabel *)localPlace;
- (void) cellDidPressLikeButton:(Top5TableViewCell *)cell;
- (void) cell:(Top5TableViewCell *)cell didTapCategory:(UILabel *)category;



@end


@interface Top5TableViewCell : UITableViewCell




@end
