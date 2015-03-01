//
//  MakeMenuViewController.h
//  Forks and Spoon
//
//  Created by Vaish Raman on 2/28/15.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MakeMenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) NSString *cookId;
@property (nonatomic, assign) BOOL cookIdAvailable;
@end
