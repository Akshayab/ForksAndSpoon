//
//  MainTableView.m
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "MainTableView.h"

@implementation MainTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSections {
    return 1;
}

-(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
//    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

@end
