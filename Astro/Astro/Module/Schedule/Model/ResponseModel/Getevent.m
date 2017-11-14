//
//  Getevent.m
//
//  Created by   on 30/10/2017
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Getevent.h"


NSString *const kGeteventLongSynopsis = @"longSynopsis";
NSString *const kGeteventHighlight = @"highlight";
NSString *const kGeteventContentImage = @"contentImage";
NSString *const kGeteventLive = @"live";
NSString *const kGeteventDirectors = @"directors";
NSString *const kGeteventChannelStbNumber = @"channelStbNumber";
NSString *const kGeteventDisplayDuration = @"displayDuration";
NSString *const kGeteventVernacularData = @"vernacularData";
NSString *const kGeteventDisplayDateTimeUtc = @"displayDateTimeUtc";
NSString *const kGeteventChannelTitle = @"channelTitle";
NSString *const kGeteventPremier = @"premier";
NSString *const kGeteventSiTrafficKey = @"siTrafficKey";
NSString *const kGeteventOttBlackout = @"ottBlackout";
NSString *const kGeteventProducers = @"producers";
NSString *const kGeteventProgrammeId = @"programmeId";
NSString *const kGeteventActors = @"actors";
NSString *const kGeteventEpisodeId = @"episodeId";
NSString *const kGeteventSubGenre = @"subGenre";
NSString *const kGeteventGroupKey = @"groupKey";
NSString *const kGeteventDisplayDateTime = @"displayDateTime";
NSString *const kGeteventEventID = @"eventID";
NSString *const kGeteventEpgEventImage = @"epgEventImage";
NSString *const kGeteventShortSynopsis = @"shortSynopsis";
NSString *const kGeteventProgrammeTitle = @"programmeTitle";
NSString *const kGeteventGenre = @"genre";
NSString *const kGeteventContentId = @"contentId";
NSString *const kGeteventCertification = @"certification";
NSString *const kGeteventChannelId = @"channelId";
NSString *const kGeteventChannelHD = @"channelHD";


@interface Getevent ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Getevent

@synthesize longSynopsis = _longSynopsis;
@synthesize highlight = _highlight;
@synthesize contentImage = _contentImage;
@synthesize live = _live;
@synthesize directors = _directors;
@synthesize channelStbNumber = _channelStbNumber;
@synthesize displayDuration = _displayDuration;
@synthesize vernacularData = _vernacularData;
@synthesize displayDateTimeUtc = _displayDateTimeUtc;
@synthesize channelTitle = _channelTitle;
@synthesize premier = _premier;
@synthesize siTrafficKey = _siTrafficKey;
@synthesize ottBlackout = _ottBlackout;
@synthesize producers = _producers;
@synthesize programmeId = _programmeId;
@synthesize actors = _actors;
@synthesize episodeId = _episodeId;
@synthesize subGenre = _subGenre;
@synthesize groupKey = _groupKey;
@synthesize displayDateTime = _displayDateTime;
@synthesize eventID = _eventID;
@synthesize epgEventImage = _epgEventImage;
@synthesize shortSynopsis = _shortSynopsis;
@synthesize programmeTitle = _programmeTitle;
@synthesize genre = _genre;
@synthesize contentId = _contentId;
@synthesize certification = _certification;
@synthesize channelId = _channelId;
@synthesize channelHD = _channelHD;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.longSynopsis = [self objectOrNilForKey:kGeteventLongSynopsis fromDictionary:dict];
            self.highlight = [self objectOrNilForKey:kGeteventHighlight fromDictionary:dict];
            self.contentImage = [self objectOrNilForKey:kGeteventContentImage fromDictionary:dict];
            self.live = [[self objectOrNilForKey:kGeteventLive fromDictionary:dict] boolValue];
            self.directors = [self objectOrNilForKey:kGeteventDirectors fromDictionary:dict];
            self.channelStbNumber = [self objectOrNilForKey:kGeteventChannelStbNumber fromDictionary:dict];
            self.displayDuration = [self objectOrNilForKey:kGeteventDisplayDuration fromDictionary:dict];
            self.vernacularData = [self objectOrNilForKey:kGeteventVernacularData fromDictionary:dict];
            self.displayDateTimeUtc = [self objectOrNilForKey:kGeteventDisplayDateTimeUtc fromDictionary:dict];
            self.channelTitle = [self objectOrNilForKey:kGeteventChannelTitle fromDictionary:dict];
            self.premier = [[self objectOrNilForKey:kGeteventPremier fromDictionary:dict] boolValue];
            self.siTrafficKey = [self objectOrNilForKey:kGeteventSiTrafficKey fromDictionary:dict];
            self.ottBlackout = [[self objectOrNilForKey:kGeteventOttBlackout fromDictionary:dict] boolValue];
            self.producers = [self objectOrNilForKey:kGeteventProducers fromDictionary:dict];
            self.programmeId = [self objectOrNilForKey:kGeteventProgrammeId fromDictionary:dict];
            self.actors = [self objectOrNilForKey:kGeteventActors fromDictionary:dict];
            self.episodeId = [self objectOrNilForKey:kGeteventEpisodeId fromDictionary:dict];
            self.subGenre = [self objectOrNilForKey:kGeteventSubGenre fromDictionary:dict];
            self.groupKey = [self objectOrNilForKey:kGeteventGroupKey fromDictionary:dict];
            self.displayDateTime = [self objectOrNilForKey:kGeteventDisplayDateTime fromDictionary:dict];
            self.eventID = [self objectOrNilForKey:kGeteventEventID fromDictionary:dict];
            self.epgEventImage = [self objectOrNilForKey:kGeteventEpgEventImage fromDictionary:dict];
            self.shortSynopsis = [self objectOrNilForKey:kGeteventShortSynopsis fromDictionary:dict];
            self.programmeTitle = [self objectOrNilForKey:kGeteventProgrammeTitle fromDictionary:dict];
            self.genre = [self objectOrNilForKey:kGeteventGenre fromDictionary:dict];
            self.contentId = [self objectOrNilForKey:kGeteventContentId fromDictionary:dict];
            self.certification = [self objectOrNilForKey:kGeteventCertification fromDictionary:dict];
            self.channelId = [[self objectOrNilForKey:kGeteventChannelId fromDictionary:dict] doubleValue];
            self.channelHD = [self objectOrNilForKey:kGeteventChannelHD fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.longSynopsis forKey:kGeteventLongSynopsis];
    [mutableDict setValue:self.highlight forKey:kGeteventHighlight];
    [mutableDict setValue:self.contentImage forKey:kGeteventContentImage];
    [mutableDict setValue:[NSNumber numberWithBool:self.live] forKey:kGeteventLive];
    [mutableDict setValue:self.directors forKey:kGeteventDirectors];
    [mutableDict setValue:self.channelStbNumber forKey:kGeteventChannelStbNumber];
    [mutableDict setValue:self.displayDuration forKey:kGeteventDisplayDuration];
    NSMutableArray *tempArrayForVernacularData = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.vernacularData) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVernacularData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVernacularData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVernacularData] forKey:kGeteventVernacularData];
    [mutableDict setValue:self.displayDateTimeUtc forKey:kGeteventDisplayDateTimeUtc];
    [mutableDict setValue:self.channelTitle forKey:kGeteventChannelTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.premier] forKey:kGeteventPremier];
    [mutableDict setValue:self.siTrafficKey forKey:kGeteventSiTrafficKey];
    [mutableDict setValue:[NSNumber numberWithBool:self.ottBlackout] forKey:kGeteventOttBlackout];
    [mutableDict setValue:self.producers forKey:kGeteventProducers];
    [mutableDict setValue:self.programmeId forKey:kGeteventProgrammeId];
    [mutableDict setValue:self.actors forKey:kGeteventActors];
    [mutableDict setValue:self.episodeId forKey:kGeteventEpisodeId];
    [mutableDict setValue:self.subGenre forKey:kGeteventSubGenre];
    [mutableDict setValue:self.groupKey forKey:kGeteventGroupKey];
    [mutableDict setValue:self.displayDateTime forKey:kGeteventDisplayDateTime];
    [mutableDict setValue:self.eventID forKey:kGeteventEventID];
    [mutableDict setValue:self.epgEventImage forKey:kGeteventEpgEventImage];
    [mutableDict setValue:self.shortSynopsis forKey:kGeteventShortSynopsis];
    [mutableDict setValue:self.programmeTitle forKey:kGeteventProgrammeTitle];
    [mutableDict setValue:self.genre forKey:kGeteventGenre];
    [mutableDict setValue:self.contentId forKey:kGeteventContentId];
    [mutableDict setValue:self.certification forKey:kGeteventCertification];
    [mutableDict setValue:[NSNumber numberWithDouble:self.channelId] forKey:kGeteventChannelId];
    [mutableDict setValue:self.channelHD forKey:kGeteventChannelHD];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.longSynopsis = [aDecoder decodeObjectForKey:kGeteventLongSynopsis];
    self.highlight = [aDecoder decodeObjectForKey:kGeteventHighlight];
    self.contentImage = [aDecoder decodeObjectForKey:kGeteventContentImage];
    self.live = [aDecoder decodeBoolForKey:kGeteventLive];
    self.directors = [aDecoder decodeObjectForKey:kGeteventDirectors];
    self.channelStbNumber = [aDecoder decodeObjectForKey:kGeteventChannelStbNumber];
    self.displayDuration = [aDecoder decodeObjectForKey:kGeteventDisplayDuration];
    self.vernacularData = [aDecoder decodeObjectForKey:kGeteventVernacularData];
    self.displayDateTimeUtc = [aDecoder decodeObjectForKey:kGeteventDisplayDateTimeUtc];
    self.channelTitle = [aDecoder decodeObjectForKey:kGeteventChannelTitle];
    self.premier = [aDecoder decodeBoolForKey:kGeteventPremier];
    self.siTrafficKey = [aDecoder decodeObjectForKey:kGeteventSiTrafficKey];
    self.ottBlackout = [aDecoder decodeBoolForKey:kGeteventOttBlackout];
    self.producers = [aDecoder decodeObjectForKey:kGeteventProducers];
    self.programmeId = [aDecoder decodeObjectForKey:kGeteventProgrammeId];
    self.actors = [aDecoder decodeObjectForKey:kGeteventActors];
    self.episodeId = [aDecoder decodeObjectForKey:kGeteventEpisodeId];
    self.subGenre = [aDecoder decodeObjectForKey:kGeteventSubGenre];
    self.groupKey = [aDecoder decodeObjectForKey:kGeteventGroupKey];
    self.displayDateTime = [aDecoder decodeObjectForKey:kGeteventDisplayDateTime];
    self.eventID = [aDecoder decodeObjectForKey:kGeteventEventID];
    self.epgEventImage = [aDecoder decodeObjectForKey:kGeteventEpgEventImage];
    self.shortSynopsis = [aDecoder decodeObjectForKey:kGeteventShortSynopsis];
    self.programmeTitle = [aDecoder decodeObjectForKey:kGeteventProgrammeTitle];
    self.genre = [aDecoder decodeObjectForKey:kGeteventGenre];
    self.contentId = [aDecoder decodeObjectForKey:kGeteventContentId];
    self.certification = [aDecoder decodeObjectForKey:kGeteventCertification];
    self.channelId = [aDecoder decodeDoubleForKey:kGeteventChannelId];
    self.channelHD = [aDecoder decodeObjectForKey:kGeteventChannelHD];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_longSynopsis forKey:kGeteventLongSynopsis];
    [aCoder encodeObject:_highlight forKey:kGeteventHighlight];
    [aCoder encodeObject:_contentImage forKey:kGeteventContentImage];
    [aCoder encodeBool:_live forKey:kGeteventLive];
    [aCoder encodeObject:_directors forKey:kGeteventDirectors];
    [aCoder encodeObject:_channelStbNumber forKey:kGeteventChannelStbNumber];
    [aCoder encodeObject:_displayDuration forKey:kGeteventDisplayDuration];
    [aCoder encodeObject:_vernacularData forKey:kGeteventVernacularData];
    [aCoder encodeObject:_displayDateTimeUtc forKey:kGeteventDisplayDateTimeUtc];
    [aCoder encodeObject:_channelTitle forKey:kGeteventChannelTitle];
    [aCoder encodeBool:_premier forKey:kGeteventPremier];
    [aCoder encodeObject:_siTrafficKey forKey:kGeteventSiTrafficKey];
    [aCoder encodeBool:_ottBlackout forKey:kGeteventOttBlackout];
    [aCoder encodeObject:_producers forKey:kGeteventProducers];
    [aCoder encodeObject:_programmeId forKey:kGeteventProgrammeId];
    [aCoder encodeObject:_actors forKey:kGeteventActors];
    [aCoder encodeObject:_episodeId forKey:kGeteventEpisodeId];
    [aCoder encodeObject:_subGenre forKey:kGeteventSubGenre];
    [aCoder encodeObject:_groupKey forKey:kGeteventGroupKey];
    [aCoder encodeObject:_displayDateTime forKey:kGeteventDisplayDateTime];
    [aCoder encodeObject:_eventID forKey:kGeteventEventID];
    [aCoder encodeObject:_epgEventImage forKey:kGeteventEpgEventImage];
    [aCoder encodeObject:_shortSynopsis forKey:kGeteventShortSynopsis];
    [aCoder encodeObject:_programmeTitle forKey:kGeteventProgrammeTitle];
    [aCoder encodeObject:_genre forKey:kGeteventGenre];
    [aCoder encodeObject:_contentId forKey:kGeteventContentId];
    [aCoder encodeObject:_certification forKey:kGeteventCertification];
    [aCoder encodeDouble:_channelId forKey:kGeteventChannelId];
    [aCoder encodeObject:_channelHD forKey:kGeteventChannelHD];
}

- (id)copyWithZone:(NSZone *)zone {
    Getevent *copy = [[Getevent alloc] init];
    
    
    
    if (copy) {

        copy.longSynopsis = [self.longSynopsis copyWithZone:zone];
        copy.highlight = [self.highlight copyWithZone:zone];
        copy.contentImage = [self.contentImage copyWithZone:zone];
        copy.live = self.live;
        copy.directors = [self.directors copyWithZone:zone];
        copy.channelStbNumber = [self.channelStbNumber copyWithZone:zone];
        copy.displayDuration = [self.displayDuration copyWithZone:zone];
        copy.vernacularData = [self.vernacularData copyWithZone:zone];
        copy.displayDateTimeUtc = [self.displayDateTimeUtc copyWithZone:zone];
        copy.channelTitle = [self.channelTitle copyWithZone:zone];
        copy.premier = self.premier;
        copy.siTrafficKey = [self.siTrafficKey copyWithZone:zone];
        copy.ottBlackout = self.ottBlackout;
        copy.producers = [self.producers copyWithZone:zone];
        copy.programmeId = [self.programmeId copyWithZone:zone];
        copy.actors = [self.actors copyWithZone:zone];
        copy.episodeId = [self.episodeId copyWithZone:zone];
        copy.subGenre = [self.subGenre copyWithZone:zone];
        copy.groupKey = [self.groupKey copyWithZone:zone];
        copy.displayDateTime = [self.displayDateTime copyWithZone:zone];
        copy.eventID = [self.eventID copyWithZone:zone];
        copy.epgEventImage = [self.epgEventImage copyWithZone:zone];
        copy.shortSynopsis = [self.shortSynopsis copyWithZone:zone];
        copy.programmeTitle = [self.programmeTitle copyWithZone:zone];
        copy.genre = [self.genre copyWithZone:zone];
        copy.contentId = [self.contentId copyWithZone:zone];
        copy.certification = [self.certification copyWithZone:zone];
        copy.channelId = self.channelId;
        copy.channelHD = [self.channelHD copyWithZone:zone];
    }
    
    return copy;
}


@end
