//
//  TvGuideDBUtil.h
//  Astro
//
//  Created by Muzammil Peer on 30/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetChannelListResponseModel.h"
#import <MagicalRecord/MagicalRecord.h>
#import "ChannelEntity.h"

@interface TvGuideDBUtil : NSObject

+ (void) saveChannels:(GetChannelListResponseModel*)response;
+ (int) getChannelsCount;
+ (NSArray*) getChannelListPaginated:(int)pageNo withPageSize:(int)pageSize withSorting:(NSString*)sortKey;
+ (NSMutableArray*) getChannelIdsPaginated:(int)pageNo withPageSize:(int)pageSize withSorting:(NSString*)sortKey;

@end
