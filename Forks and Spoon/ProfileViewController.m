//
//  ProfileViewController.m
//  Forks and Spoon
//
//  Created by Vaish Raman on 2/28/15.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "ProfileViewController.h"
#import "MakeMenuViewController.h"
#import "FNSRequest.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.itemImageView.layer.cornerRadius = _itemImageView.frame.size.height/2;
    self.itemImageView.layer.masksToBounds = YES;
    self.itemImageView.layer.borderWidth = 1.0f;
    self.itemImageView.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MakeMenu"]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
        NSString *startTimeString = [dateFormatter stringFromDate:self.startTime.date];
        NSString *endTimeString = [dateFormatter stringFromDate:self.endTime.date];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *numberOfPeople = [f numberFromString:self.peopleRemaining.text];
        
        AFHTTPRequestOperation *postCookOp = [FNSRequest createCookForUserId:@"kVPzQNpR0h" withStartTimeString:startTimeString withEndTimeString:endTimeString withCapacityRemaining:numberOfPeople withCategory:self.cuisine.text withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"The response is %@", responseObject);
            MakeMenuViewController *vc = (MakeMenuViewController *)[segue destinationViewController];
            vc.cookId = responseObject;
            vc.cookIdAvailable = YES;
        } withFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"The error is %@", error);
        }];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:postCookOp];
    }
}
@end
