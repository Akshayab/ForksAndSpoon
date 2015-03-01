//
//  MakeMenuViewController.m
//  Forks and Spoon
//
//  Created by Vaish Raman on 2/28/15.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "MakeMenuViewController.h"
#import "MenuItemsCell.h"
#import "FoodItemViewController.h"
#import "FNSRequest.h"
#import "MainViewController.h"

@interface MakeMenuViewController ()

@end

@implementation MakeMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.table.delegate = self;
    self.table.dataSource = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.cookIdAvailable = NO;
    self.fetchedFoodItems = [[NSMutableArray alloc] init];
    self.fetechedFoodItemsDescriptions = [[NSMutableArray alloc] init];
    self.fetchedFoodItemNames = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.fetchedFoodItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuItemsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.FoodName.text = self.fetchedFoodItemNames[indexPath.row];
    cell.FoodInfo.text = self.fetechedFoodItemsDescriptions[indexPath.row];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addFoodItem"]) {

        
    }
    else if ([segue.identifier isEqualToString:@"addMenuItem"]){
        MainViewController *vc = (MainViewController *)[segue destinationViewController];
        
        if (self.cookIdAvailable) {
            NSArray *stringArrays = [self.fetchedFoodItems valueForKey:@"foodId"];
            AFHTTPRequestOperation *op = [FNSRequest createMenuForFoodItems:stringArrays cookId:[self.cookId valueForKey:@"cookId"] withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"The response is %@", responseObject);
                [vc hardReload];
            } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"The error is %@", error);
            }];
            
            NSOperationQueue *queue = [[NSOperationQueue alloc] init];
            [queue addOperation:op];
        }
    }
}

-(IBAction)comesFromFoodItem:(UIStoryboardSegue *)segue {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)confirmButtonPressed:(id)sender {
    
    
}
@end
