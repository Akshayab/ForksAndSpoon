//
//  MenuListViewController.m
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "MenuListViewController.h"
#import "MenuTableViewCell.h"
#import "FNSRequest.h"

@interface MenuListViewController ()

@end

@implementation MenuListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuItems = [[NSMutableArray alloc] init];
//    self.fetchedGddIds = [[NSArray alloc] init];
    for (NSString * string in self.fetchedGddIds) {
        AFHTTPRequestOperation *getFoodOp = [FNSRequest getFoodForId:string WithSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self.fetchedMenuItems addObject:responseObject];
            [self.tableView reloadData];
        } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"The error is %@", error);
        }];
        NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
        [operationQueue addOperation:getFoodOp];
    }
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.fetchedMenuItems = [[NSMutableArray alloc] init];
//    self.fetchedGddIds = [[NSArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    return self.fetchedMenuItems.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    NSInteger row = indexPath.row;
    static NSString *simpleTableIdentifier = @"MenuCell";
    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    cell.nameLabel.text = [self.fetchedMenuItems[row] valueForKey:@"name"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        [self.menuItems addObject:self.fetchedMenuItems[indexPath.row]];
    }
    else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        [self.menuItems removeObject:self.fetchedMenuItems[indexPath.row]];
    }
    [cell setHighlighted:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MenuNewItems"]) {
        
    }
}
- (IBAction)doneButtonPressed:(id)sender {
//    [self dismissViewControllerAnimated:self completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
