//
//  FNSRequest.h
//  Forks and Spoon
//
//  Created by Akshay Budhkar on 2015-02-28.
//  Copyright (c) 2015 Akshay Budhkar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface FNSRequest : NSObject

+ (AFHTTPRequestOperation *)getCooksWithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)getMenusForMenuId:(NSString *)menuId WithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)getOrdersWithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)createFoodItemForName:(NSString *)name
                                  withDescription:(NSString *)description
                                  withRestriction:(NSString *)restriction
                                   withSpiceLevel:(NSNumber *)spiceLevel
                                         forPrice:(NSNumber *)price
                                      withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)createCookForUserId:(NSString *)userId
                            withStartTimeString:(NSString *)startTime
                              withEndTimeString:(NSString *)endTime
                          withCapacityRemaining:(NSNumber *)capacity
                                   withCategory:(NSString *)category
                                    withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)createOrderForCookId:(NSString *)cookId
                                    withHungryId:(NSString *)hungryId
                           withSelectedFoodItems:(NSArray *)foodItems
                                     withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)createMenuForFoodItems:(NSArray *)foodItems
                                            cookId:(NSString *)cookId
                                       withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

+ (AFHTTPRequestOperation *)getFoodForId:(NSString *)foodId WithSuccessBlock:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;
@end
