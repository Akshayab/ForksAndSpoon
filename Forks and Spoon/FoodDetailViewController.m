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
    
    // Post the cook
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    NSString *startTimeString = [dateFormatter stringFromDate:[NSDate date]];
    NSString *endTimeString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:3600]];
    
    AFHTTPRequestOperation *postCookOp = [FNSRequest createCookForUserId:@"kVPzQNpR0h" withStartTimeString:startTimeString withEndTimeString:endTimeString withCapacityRemaining:@2 withCategory:@"Indian" withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response is %@", responseObject);
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"The error is %@", error);
    }];
    
    // Post Food Item
    AFHTTPRequestOperation *postFoodsOp = [FNSRequest createFoodItemForName:@"1212nfdglbngn" withDescription:@"some great ass food" withRestriction:@"None" withSpiceLevel:@1 withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@ ", responseObject);
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"The error is %@", error);
    }];
    
    // Post Menu Item
    AFHTTPRequestOperation *postMenuOp = [FNSRequest createMenuForFoodItems:@[@"PH7QpmHYwz"] cookId:@"40MOD4vEpz" withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        NSLog(@"%@ ", responseObject);
        
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"The error is %@", error);
    }];
    
    // Post Order Item
    AFHTTPRequestOperation *postOrderOp = [FNSRequest createOrderForCookId:@"40MOD4vEpz" withHungryId:@"kVPzQNpR0h" withSelectedFoodItems:@[@"PH7QpmHYwz"] withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@ ", responseObject);
        
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"The error is %@", error);
        
    }];
    
    // Get Cook Item
    AFHTTPRequestOperation *getCooksOp = [FNSRequest getCooksWithSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response is %@", responseObject);
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"The error is %@", error);
    }];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    // Get Menu Items
    AFHTTPRequestOperation *getMenusOp = [FNSRequest getMenusWithSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"The response is %@", responseObject);
        
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"the error is %@", error);
    }];
    
    
    
    // Add operations
    
    [operationQueue addOperation:getCooksOp];
    [operationQueue addOperation:getMenusOp];
    [operationQueue addOperation:postFoodsOp];
    [operationQueue addOperation:postCookOp];
    [operationQueue addOperation:postMenuOp];
    [operationQueue addOperation:postOrderOp];
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
        }
    }
}

//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    if ([identifier isEqualToString:@"PlaceOrder"]) {
//        if (self.menuItems.count) {
//            return YES;
//        }
//    }
//    return NO;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"PlaceOrder"]) {
        OrderViewController *vc = (OrderViewController *)segue.destinationViewController;
        vc.cookName = self.cookName.text;
        vc.date = self.datePicker.date;
        vc.address = self.address.text;
        NSArray *strings = [self.menuItems valueForKey:@"name"];
        vc.menuItemsString = [strings componentsJoinedByString:@","];
    }
    else if ([segue.identifier isEqualToString:@"MenuItems"]) {
        MenuListViewController *vc = (MenuListViewController *)segue.destinationViewController;
        vc.menuItems = self.menuItems;
    }
}
@end
