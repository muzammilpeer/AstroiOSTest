//
//  Getevent.h
//
//  Created by   on 30/10/2017
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Getevent : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id longSynopsis;
@property (nonatomic, assign) id highlight;
@property (nonatomic, assign) id contentImage;
@property (nonatomic, assign) BOOL live;
@property (nonatomic, strong) NSString *directors;
@property (nonatomic, strong) NSString *channelStbNumber;
@property (nonatomic, strong) NSString *displayDuration;
@property (nonatomic, strong) NSArray *vernacularData;
@property (nonatomic, strong) NSString *displayDateTimeUtc;
@property (nonatomic, strong) NSString *channelTitle;
@property (nonatomic, assign) BOOL premier;
@property (nonatomic, strong) NSString *siTrafficKey;
@property (nonatomic, assign) BOOL ottBlackout;
@property (nonatomic, strong) NSString *producers;
@property (nonatomic, strong) NSString *programmeId;
@property (nonatomic, strong) NSString *actors;
@property (nonatomic, strong) NSString *episodeId;
@property (nonatomic, strong) NSString *subGenre;
@property (nonatomic, assign) id groupKey;
@property (nonatomic, strong) NSString *displayDateTime;
@property (nonatomic, strong) NSString *eventID;
@property (nonatomic, assign) id epgEventImage;
@property (nonatomic, strong) NSString *shortSynopsis;
@property (nonatomic, strong) NSString *programmeTitle;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, assign) id contentId;
@property (nonatomic, strong) NSString *certification;
@property (nonatomic, assign) double channelId;
@property (nonatomic, strong) NSString *channelHD;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
