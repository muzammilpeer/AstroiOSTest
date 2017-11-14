//
//  GetEventRequestModel.h
//  Astro
//
//  Created by Muzammil Peer on 30/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "BaseRequestModel.h"

@interface GetEventRequestModel : BaseRequestModel

@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, strong) NSString *periodStart;
@property (nonatomic, strong) NSString *periodEnd;

@end
