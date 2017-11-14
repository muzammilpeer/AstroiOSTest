//
//  GetEventResponseModel.h
//
//  Created by   on 30/10/2017
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Getevent.h"

#import "BaseResponseModel.h"

@interface GetEventResponseModel : BaseResponseModel <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *getevent;

@end
