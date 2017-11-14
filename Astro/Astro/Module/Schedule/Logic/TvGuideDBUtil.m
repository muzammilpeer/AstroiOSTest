//
//  TvGuideDBUtil.m
//  Astro
//
//  Created by Muzammil Peer on 30/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "TvGuideDBUtil.h"


@implementation TvGuideDBUtil

+ (void) saveChannels:(GetChannelListResponseModel*)response
{
 
    for (int i=0; i < response.channels.count; i++) {
        
        Channels *channel = [response.channels objectAtIndex:i];
        
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"channelId = %@",[NSNumber numberWithDouble:channel.channelId]];
        
        ChannelEntity *entity = nil;
        entity = [ChannelEntity MR_findFirstWithPredicate:searchPredicate];
        if (entity == nil) {
            entity = [ChannelEntity MR_createEntity];
        }
        
        entity.channelId = channel.channelId;
        entity.stbNo = channel.channelStbNumber;
        entity.channelName = channel.channelTitle;
    }
}


+ (int) getChannelsCount
{
    return [ChannelEntity MR_countOfEntities];
}

+ (NSArray*) getChannelListPaginated:(int)pageNo withPageSize:(int)pageSize withSorting:(NSString*)sortKey
{
    NSFetchRequest *request = [ChannelEntity MR_requestAllSortedBy:sortKey ascending:true];
    request.fetchLimit = pageSize;
    [request setFetchOffset:pageNo == 0 ? 0 : pageSize * pageNo];
    NSLog(@"request.fetchOffset = %d",request.fetchOffset);
    
    return [ChannelEntity MR_executeFetchRequest:request];
}

+ (NSMutableArray*) getChannelIdsPaginated:(int)pageNo withPageSize:(int)pageSize withSorting:(NSString*)sortKey
{
    NSMutableArray *idLists = [NSMutableArray new];
    
    NSFetchRequest *request = [ChannelEntity MR_requestAllSortedBy:sortKey ascending:true];
    request.fetchLimit = pageSize;
    [request setFetchOffset:pageNo == 0 ? 0 : pageSize * pageNo];

    NSLog(@"request.fetchOffset = %d",request.fetchOffset);
    
    NSArray *entities = [ChannelEntity MR_executeFetchRequest:request];
    if (entities != nil && entities.count > 0) {
        for (int i=0; i<entities.count; i++) {
            ChannelEntity *entity = [entities objectAtIndex:i];
            [idLists addObject:[NSNumber numberWithDouble:entity.channelId]];
        }
    }
    
    return idLists;
}

@end
