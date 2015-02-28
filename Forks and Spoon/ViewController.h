//
//  ViewController.h
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@end

