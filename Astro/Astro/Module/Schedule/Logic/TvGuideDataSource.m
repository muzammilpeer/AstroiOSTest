//
//  TvGuideDataSource.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "TvGuideDataSource.h"
#import "TvGuideDBUtil.h"

@implementation TvGuideDataSource

+ (NSMutableArray*) generateTvGuideDataSource:(GetEventResponseModel*)events withPageNo:(int)pageNo withPageSize:(int)pageSize withSort:(NSString *)sortKey
{
    NSMutableArray* modelsGenerated = [NSMutableArray new];
    NSArray *channelEntities = [TvGuideDBUtil getChannelListPaginated:pageNo withPageSize:pageSize withSorting:sortKey];
    
    if ([channelEntities count] > 0) {
        
        for (int i=0; i < [channelEntities count]; i++) {
            DynamicRowModel * row = [DynamicRowModel new];
            ChannelEntity *channelEntity = [channelEntities objectAtIndex:i];
            
            row.metaData = channelEntity;
            row.rowID = channelEntity.stbNo;
            row.rowSubId = channelEntity.channelId;
            
            row.rowCellIdentifier = @"ChannelTableViewCell";
            row.rowTitle = channelEntity.channelName;
            
            int programRowHeight = 44;
            
            NSMutableArray* programsData = [NSMutableArray new];
            NSMutableArray *filteredPrograms = [self getAllEventsFor:channelEntity.channelId withPrograms:events];
            
            for (int j=0; j< filteredPrograms.count; j++) {
                
                DynamicRowModel * program = [DynamicRowModel new];
                program.rowID =j+1;
                program.rowHeight = programRowHeight;
                program.rawData = [filteredPrograms objectAtIndex:j];
//  @{@"key":@"test",@"value":@"test1ing"};
                program.rowCellIdentifier = @"ProgramTableViewCell";
                
                [programsData addObject:program];
            }
            if (filteredPrograms.count == 0) {
                DynamicRowModel * program = [DynamicRowModel new];
                program.rowID = 1;
                program.rowHeight = programRowHeight;
                program.rawData = @{@"key":@"No program found",@"value":@""};
                program.rowCellIdentifier = @"ProgramTableViewCell";
                
                [programsData addObject:program];
            }
            
            
            ProgramScheduleModel *schedule = [ProgramScheduleModel new];
            schedule.programList = programsData;
            
            if ([programsData count] > 0) {
                schedule.fullHeight = programsData.count * programRowHeight;
            }else {
                schedule.fullHeight = 0;
            }
            
            if (schedule.fullHeight <= 104) {
                row.rowHeight = 104;
            }else {
                row.rowHeight = schedule.fullHeight + 8 + 8;
            }
            row.rawData = schedule;
            
            [modelsGenerated addObject:row];
        }
    }
    
    
    return modelsGenerated;
}

+ (NSMutableArray*) getAllEventsFor:(double)channelId withPrograms:(GetEventResponseModel*)response
{
    NSMutableArray *allPrograms = [NSMutableArray new];
    
    if (response != nil ) {
        for (int i=0; i< response.getevent.count ; i++) {
            
            Getevent *model = [response.getevent objectAtIndex:i];
            
            if (model.channelId == channelId) {
                [allPrograms addObject:model];
            }
        }
    }
    return allPrograms;
}


+(int)getRandomNumberBetween:(int)from to:(int)to {
    
    return (int)from + arc4random() % (to-from+1);
}

@end
