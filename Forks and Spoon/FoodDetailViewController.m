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

@interface FoodDetailViewController ()

@end

@implementation FoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuItems = [[NSMutableArray alloc] init];
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
