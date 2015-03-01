//
//  FoodDetailViewController.h
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodDetailViewController : UIViewController

@property (nonatomic, strong) NSString *name;
- (IBAction)cancelView:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *proileView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UILabel *addItemsLabel;
@property (strong, nonatomic) IBOutlet UILabel *foodItemsLabel;
@property (strong, nonatomic) IBOutlet UILabel *cookName;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (strong, nonatomic) NSMutableArray *menuItems;
@property (strong, nonatomic) NSMutableDictionary *fetchedMenuData;
@property (strong, nonatomic) NSMutableArray *fetchedCookData;

@property (strong, nonatomic) NSString *cookId;

@end
