//
//  Channels.m
//

#import "Channels.h"


NSString *const kChannelsChannelId = @"channelId";
NSString *const kChannelsChannelTitle = @"channelTitle";
NSString *const kChannelsChannelStbNumber = @"channelStbNumber";


@interface Channels ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Channels

@synthesize channelId = _channelId;
@synthesize channelTitle = _channelTitle;
@synthesize channelStbNumber = _channelStbNumber;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.channelId = [[self objectOrNilForKey:kChannelsChannelId fromDictionary:dict] doubleValue];
            self.channelTitle = [self objectOrNilForKey:kChannelsChannelTitle fromDictionary:dict];
            self.channelStbNumber = [[self objectOrNilForKey:kChannelsChannelStbNumber fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.channelId] forKey:kChannelsChannelId];
    [mutableDict setValue:self.channelTitle forKey:kChannelsChannelTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.channelStbNumber] forKey:kChannelsChannelStbNumber];

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

    self.channelId = [aDecoder decodeDoubleForKey:kChannelsChannelId];
    self.channelTitle = [aDecoder decodeObjectForKey:kChannelsChannelTitle];
    self.channelStbNumber = [aDecoder decodeDoubleForKey:kChannelsChannelStbNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_channelId forKey:kChannelsChannelId];
    [aCoder encodeObject:_channelTitle forKey:kChannelsChannelTitle];
    [aCoder encodeDouble:_channelStbNumber forKey:kChannelsChannelStbNumber];
}

- (id)copyWithZone:(NSZone *)zone {
    Channels *copy = [[Channels alloc] init];
    
    if (copy) {

        copy.channelId = self.channelId;
        copy.channelTitle = [self.channelTitle copyWithZone:zone];
        copy.channelStbNumber = self.channelStbNumber;
    }
    
    return copy;
}


@end
