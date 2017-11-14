//
//  TvGuideDataSource.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicRowModel.h"
#import "ProgramScheduleModel.h"
#import "GetChannelListResponseModel.h"
#import "AppConfig.h"
#import "GetEventResponseModel.h"


@interface TvGuideDataSource : NSObject

+ (NSMutableArray*) generateTvGuideDataSource:(GetEventResponseModel*)events withPageNo:(int)pageNo withPageSize:(int)pageSize  withSort:(NSString *)sortKey;

@end
