//
//  FNSRequest.m
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import "FNSRequest.h"
#import "AFNetworking.h"
@import Foundation;

@implementation FNSRequest

+ (NSDictionary *)testLocationUrl {
    NSString *londonWeather = @"http://api.openweathermap.org/data/2.5/weather?q=London,uk";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:londonWeather]];
    
    NSURLSession *urlSession = [NSURLSession sharedSession];
    [[urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSLog(@"This is success");
        NSLog(@"%@", data);
    }] resume];
    return nil;
}

+ (AFHTTPRequestOperation *)testLocationUrlwithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    
    NSMutableURLRequest *londonWeather =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://pure-gorge-1132.herokuapp.com/get_cook"]];
    [londonWeather setHTTPMethod:@"GET"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:londonWeather];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
//    op.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}
@end
