//
//  MenuListViewController.h
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuListViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *someLabel;
- (IBAction)doneButtonPressed:(id)sender;

@property (strong, nonatomic) NSMutableArray *menuItems;
@property (weak, nonatomic) IBOutlet UILabel *itemInfo;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) NSMutableArray *fetchedMenuItems;
@property (strong, nonatomic) NSArray *fetchedGddIds;
@end
