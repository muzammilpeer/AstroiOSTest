//
//  GetChannelListResponseModel.m
//

#import "GetChannelListResponseModel.h"


NSString *const kGetChannelListResponseModelChannels = @"channels";


@interface GetChannelListResponseModel ()


@end

@implementation GetChannelListResponseModel

@synthesize channels = _channels;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super initWithDictionary:dict];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedChannels = [dict objectForKey:kGetChannelListResponseModelChannels];
    NSMutableArray *parsedChannels = [NSMutableArray array];
    
    if ([receivedChannels isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedChannels) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedChannels addObject:[Channels modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedChannels isKindOfClass:[NSDictionary class]]) {
       [parsedChannels addObject:[Channels modelObjectWithDictionary:(NSDictionary *)receivedChannels]];
    }

    self.channels = [NSArray arrayWithArray:parsedChannels];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:[super dictionaryRepresentation]];
    NSMutableArray *tempArrayForChannels = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.channels) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChannels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChannels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChannels] forKey:kGetChannelListResponseModelChannels];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}



#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    self.channels = [aDecoder decodeObjectForKey:kGetChannelListResponseModelChannels];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];

    [aCoder encodeObject:_channels forKey:kGetChannelListResponseModelChannels];
}

- (id)copyWithZone:(NSZone *)zone {
    GetChannelListResponseModel *copy = [super copyWithZone:zone];
    
    if (copy) {
        copy.channels = [self.channels copyWithZone:zone];
    }
    
    return copy;
}


@end
