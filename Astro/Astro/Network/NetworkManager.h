//
//  NetworkManager.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequestModel.h"
#import "BaseResponseModel.h"
#import "BaseNetworkError.h"
#import "AFNetworking.h"
#import "AFNetworkReachabilityManager.h"
#import "NetworkUri.h"


typedef enum {
    GET  = 0,
    POST = 1
}REQUEST_METHOD;

#define BASE_URL @"http://ams-api.astro.com.my/"


@interface NetworkManager : NSObject

+ (void) execute:(REQUEST_METHOD)method
  withRequestUri:(NSString*)uri
  withParameters:(BaseRequestModel*)request
    successBlock:(void(^)(REQUEST_METHOD requestMethod,BaseRequestModel* request,id response ))successBlock
    failureBlock:(void(^)(REQUEST_METHOD requestMethod,BaseRequestModel* request,BaseNetworkError* error))failureBlock;

@end
