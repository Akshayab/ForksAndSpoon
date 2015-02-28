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

+ (NSDictionary *)testLocationUrl;
+ (AFHTTPRequestOperation *)testLocationUrlwithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))successBlock withFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock;

@end
