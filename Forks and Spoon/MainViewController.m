//
//  ViewController.m
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "MainViewController.h"
#import "FNSRequest.h"
#import "FoodDetailViewController.h"
#import "MainTableViewCell.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;

    // Do any additional setup after loading the view, typically from a nib.
    self.fetchedCookedArray = [[NSMutableArray alloc] init];
    // Get Cook Item
    AFHTTPRequestOperation *getCooksOp = [FNSRequest getCooksWithSuccessBlock:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.fetchedCookedArray = [responseObject valueForKey:@"results"];
        [self.mainTableView reloadData];
    } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"The error is %@", error);
    }];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:getCooksOp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    if (!self.fetchedCookedArray) {
        return 5;
    }
    return self.fetchedCookedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *simpleTableIdentifier = @"Cell";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        
    }
    
    cell.nameLabel.text = @"Badass is";
    UIImageView *itemImageView = (UIImageView *)[cell viewWithTag:200];
    
    itemImageView.layer.cornerRadius = itemImageView.frame.size.height/2;
    itemImageView.layer.masksToBounds = YES;
    itemImageView.layer.borderWidth = 1.0f;
    itemImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
    UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 277, 58)];
    UIImageView *back_av = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 277, 58)];
    
    av.backgroundColor = [UIColor clearColor];
    av.opaque = NO;
    av.image = [UIImage imageNamed:@"mexicanfood"];
    cell.backgroundView = av;
    cell.selectedBackgroundView = back_av;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200.0;
}

/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
 UINavigationController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FoodDetail"];
 [self presentViewController:vc animated:YES completion:^{
 
 }];
 }*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"FoodDetail"]) {
        NSIndexPath *row = [self.mainTableView indexPathForSelectedRow];
        [self.mainTableView deselectRowAtIndexPath:row animated:YES];
        FoodDetailViewController *vc = (FoodDetailViewController *)[segue destinationViewController];
        if (self.fetchedCookedArray.count) {
            vc.cookId = [[self.fetchedCookedArray objectAtIndex:[row row]] valueForKey:@"menuId"];
        }
        
    }
}

-(IBAction)newCookAdded: (UIStoryboardSegue *)segue {
    
}

@end
