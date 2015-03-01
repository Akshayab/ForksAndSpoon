//
//  ProfileViewController.h
//  Forks and Spoon
//
//  Created by Vaish Raman on 2/28/15.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextField *addressField;
@property (strong, nonatomic) IBOutlet UITextField *cuisine;
@property (strong, nonatomic) IBOutlet UITextField *peopleRemaining;
@property (strong, nonatomic) IBOutlet UIDatePicker *startTime;

@property (strong, nonatomic) IBOutlet UIButton *continueButtonPressed;
@property (strong, nonatomic) IBOutlet UIDatePicker *endTime;
@end
