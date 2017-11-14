//
//  ProgramesEntity.h
//
//  Created by   on 30/10/2017
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>



@interface ProgramesEntity : NSManagedObject

@property (nonatomic, retain) NSString *programTitle;
@property (nonatomic, retain) NSNumber *programId;
@property (nonatomic, retain) NSString *programStart;
@property (nonatomic, retain) NSString *programDuration;
@property (nonatomic, retain) NSNumber *channelId;


@end

