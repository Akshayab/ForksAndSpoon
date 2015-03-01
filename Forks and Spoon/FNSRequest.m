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



+ (AFHTTPRequestOperation *)getCooksWithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    
    NSMutableURLRequest *londonWeather =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://pure-gorge-1132.herokuapp.com/get_cook"]];
    [londonWeather setHTTPMethod:@"GET"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:londonWeather];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    //    op.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)getMenusForMenuId:(NSString *)menuId WithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    
    NSMutableURLRequest *londonWeather =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://pure-gorge-1132.herokuapp.com/get_menu/%@", menuId]]];
    [londonWeather setHTTPMethod:@"GET"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:londonWeather];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    //    op.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)getFoodForId:(NSString *)foodId WithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock
{
    
    NSMutableURLRequest *londonWeather =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://pure-gorge-1132.herokuapp.com/get_food/%@", foodId]]];
    [londonWeather setHTTPMethod:@"GET"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:londonWeather];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    //    op.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)getOrdersWithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    
    NSMutableURLRequest *londonWeather =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://pure-gorge-1132.herokuapp.com/get_order"]];
    [londonWeather setHTTPMethod:@"GET"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:londonWeather];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    //    op.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)createFoodItemForName:(NSString *)name
                                  withDescription:(NSString *)description
                                  withRestriction:(NSString *)restriction
                                   withSpiceLevel:(NSNumber *)spiceLevel
                                         forPrice:(NSNumber *)price
                                      withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    NSDictionary *dataDictionary = @{@"name": name,
                                     @"description":description,
                                     @"dietaryRestriction": restriction,
                                     @"spicyLevel": spiceLevel,
                                     @"price": price};
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://pure-gorge-1132.herokuapp.com/create_food"]];
    [request setHTTPMethod:@"POST"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDictionary options:0 error:nil];
    [request setHTTPBody:data];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)createCookForUserId:(NSString *)userId
                                  withStartTimeString:(NSString *)startTime
                                  withEndTimeString:(NSString *)endTime
                          withCapacityRemaining:(NSNumber *)capacity
                                   withCategory:(NSString *)category
                                      withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    NSDictionary *dataDictionary = @{@"userId": userId,
                                     @"capacityRemaining":capacity,
                                     @"startTime": startTime,
                                     @"endTime": endTime,
                                     @"category": category};
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://pure-gorge-1132.herokuapp.com/create_cook"]];
    [request setHTTPMethod:@"POST"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDictionary options:0 error:nil];
    [request setHTTPBody:data];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)createMenuForFoodItems:(NSArray *)foodItems
                                  cookId:(NSString *)cookId
                                      withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    NSDictionary *dataDictionary = @{@"cookId": cookId,
                                     @"arrayFoodIds":foodItems};
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://pure-gorge-1132.herokuapp.com/create_menu"]];
    [request setHTTPMethod:@"POST"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDictionary options:0 error:nil];
    [request setHTTPBody:data];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}

+ (AFHTTPRequestOperation *)createOrderForCookId:(NSString *)cookId
                                  withHungryId:(NSString *)hungryId
                                  withSelectedFoodItems:(NSArray *)foodItems
                                      withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock {
    NSDictionary *dataDictionary = @{@"cookId": cookId,
                                     @"hungryId":hungryId,
                                     @"selectedFoodItems": foodItems};
    
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://pure-gorge-1132.herokuapp.com/create_order"]];
    [request setHTTPMethod:@"POST"];
    NSData *data = [NSJSONSerialization dataWithJSONObject:dataDictionary options:0 error:nil];
    [request setHTTPBody:data];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:successBlock failure:failureBlock];
    return op;
}
@end
