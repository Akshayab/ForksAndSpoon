//
//  FoodItemViewController.h
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-03-01.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodItemViewController : UIViewController <UITextFieldDelegate>
- (IBAction)confirmButtonPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *foodDescriptionField;
@property (strong, nonatomic) IBOutlet UITextField *priceLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *spicySegmentedControl;
@property (strong, nonatomic) NSString *fieldId;
@end
