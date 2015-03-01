//
//  FoodDetailViewController.m
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "FoodDetailViewController.h"
#import "MenuListViewController.h"
#import "OrderViewController.h"
#import "FNSRequest.h"
#import "AppDelegate.h"

@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuItems = [[NSMutableArray alloc] init];
    self.fetchedCookData = [[NSMutableArray alloc] init];
    self.menuItem = [[NSDictionary alloc] init];
    
    
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    // Get Menu Items
    
    AFHTTPRequestOperation *getMenuOp = [FNSRequest getMenusForMenuId:self.cookId WithSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response is %@", responseObject);
        self.menuItem = responseObject;
        self.foodIds = [self.menuItem valueForKey:@"arrayFoodIds"];
        [self setUpViews];
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"the error is %@", error);
    }];
    
    
    // Add operations
    [operationQueue addOperation:getMenuOp];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.menuView.layer setCornerRadius:4.0];
    [self.proileView.layer setCornerRadius:4.0];
    self.datePicker.minimumDate = [NSDate date];
    if (!self.menuItems.count) {
        self.addItemsLabel.hidden = NO;
        self.foodItemsLabel.hidden = YES;
    }
    else {
        
    }
}

- (void)setUpViews {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)savedMenuItems:(UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:@"MenuNewItems"]) {
        MenuListViewController *vc = (MenuListViewController *)segue.sourceViewController;
        self.menuItems = vc.menuItems;
        if (self.menuItems.count) {
            self.addItemsLabel.hidden = YES;
            self.foodItemsLabel.hidden = NO;
            NSArray *strings = [self.menuItems valueForKey:@"name"];
            self.foodItemsLabel.text = [strings componentsJoinedByString:@","];
            NSArray *prices = [self.menuItems valueForKey:@"price"];
            NSNumber *totalPrice = [prices valueForKeyPath:@"@max.floatValue"];
            if (!totalPrice) {
                self.totalPriceLabel.text = @"$ 0";
            }
            else {
                self.totalPriceLabel.text = [NSString stringWithFormat:@"$ %@", totalPrice];
            }
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PlaceOrder"]) {
        OrderViewController *vc = (OrderViewController *)segue.destinationViewController;
        vc.cookName = self.cookName.text;
        vc.date = self.datePicker.date;
        vc.address = self.address.text;
        NSArray *strings = [self.menuItems valueForKey:@"name"];
        vc.menuItemsString = [strings componentsJoinedByString:@","];
        
        // Post Order Item
        AFHTTPRequestOperation *postOrderOp = [FNSRequest createOrderForCookId:@"eWmn7hZ5ue" withHungryId:@"kVPzQNpR0h" withSelectedFoodItems:@[@"b5n8HUrL4C"] withTwilioMessage:@"Hello buddy" withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"%@ ", responseObject);
            
        } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"The error is %@", error);
            
        }];
        NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue addOperation:postOrderOp];
        
    }
    else if ([segue.identifier isEqualToString:@"MenuItems"]) {
        MenuListViewController *vc = (MenuListViewController *)segue.destinationViewController;
        vc.menuItems = self.menuItems;
        vc.fetchedGddIds = self.foodIds;
    }
}
@end
