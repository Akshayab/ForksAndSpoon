//
//  OrderViewController.h
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewController : UIViewController

@property (strong, nonatomic) NSString *cookName;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) IBOutlet UILabel *orderDescription;

@end
