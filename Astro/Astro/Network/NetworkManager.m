//
//  NetworkManager.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "NetworkManager.h"


@implementation NetworkManager


+ (void) execute:(REQUEST_METHOD)method
  withRequestUri:(NSString*)uri
  withParameters:(BaseRequestModel*)request
  successBlock:(void(^)(REQUEST_METHOD requestMethod,BaseRequestModel* request,id response ))successBlock
  failureBlock:(void(^)(REQUEST_METHOD requestMethod,BaseRequestModel* request,BaseNetworkError* error))failureBlock
{
 
//    if (![AFNetworkReachabilityManager sharedManager].isReachable) {
//        if (failureBlock)
//        {
//            failureBlock(method, request,(BaseNetworkError*)[NSError errorWithDomain:@"local" code:-604 userInfo:nil]);
//        }
//        return;
//    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    if (method == GET) {
        NSString *completeUrl = [NSString stringWithFormat:@"%@%@",BASE_URL,uri];
        
        [manager GET:completeUrl parameters:[request dictionaryRepresentation] progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
            if (successBlock)
            {
                successBlock(method, request,responseObject);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            if (failureBlock)
            {
                failureBlock(method, request,(BaseNetworkError*)error);
            }
        }];
    }
}

@end

