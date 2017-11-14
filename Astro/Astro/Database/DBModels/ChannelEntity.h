//
//  ChannelEntity.h
//
//  Created by   on 30/10/2017
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface ChannelEntity : NSManagedObject

@property (nonatomic, retain) NSString *channelImageUrl;
@property (nonatomic, assign) BOOL isFavourite;
@property (nonatomic, retain) NSString *channelName;
@property (nonatomic, assign) double stbNo;
@property (nonatomic, assign) double channelId;


@end

