//
//  GetEventRequestModel.m
//  Astro
//
//  Created by Muzammil Peer on 30/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "GetEventRequestModel.h"

NSString *const kGetEventRequestModelChannelId = @"channelId";
NSString *const kGetEventRequestModelPeriodStart = @"periodStart";
NSString *const kGetEventRequestModelPeriodEnd = @"periodEnd";

@implementation GetEventRequestModel

@synthesize channelId = _channelId;
@synthesize periodStart = _periodStart;
@synthesize periodEnd = _periodEnd;



- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super initWithDictionary:dict];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
        self.channelId = [self objectOrNilForKey:kGetEventRequestModelChannelId fromDictionary:dict];
        self.periodStart = [self objectOrNilForKey:kGetEventRequestModelPeriodStart fromDictionary:dict];
        self.periodEnd = [self objectOrNilForKey:kGetEventRequestModelPeriodEnd fromDictionary:dict];
        
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:[super dictionaryRepresentation]];
    [mutableDict setValue:self.channelId forKey:kGetEventRequestModelChannelId];
    [mutableDict setValue:self.periodStart forKey:kGetEventRequestModelPeriodStart];
    [mutableDict setValue:self.periodEnd forKey:kGetEventRequestModelPeriodEnd];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}




#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    self.channelId = [aDecoder decodeObjectForKey:kGetEventRequestModelChannelId];
    self.periodStart = [aDecoder decodeObjectForKey:kGetEventRequestModelPeriodStart];
    self.periodEnd = [aDecoder decodeObjectForKey:kGetEventRequestModelPeriodEnd];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    
    [aCoder encodeObject:_channelId forKey:kGetEventRequestModelChannelId];
    [aCoder encodeObject:_periodStart forKey:kGetEventRequestModelPeriodStart];
    [aCoder encodeObject:_periodEnd forKey:kGetEventRequestModelPeriodEnd];
}

- (id)copyWithZone:(NSZone *)zone {
    GetEventRequestModel *copy = [super copyWithZone:zone];
    
    if (copy) {
        
        copy.channelId = [self.channelId copyWithZone:zone];
        copy.periodStart = [self.periodStart copyWithZone:zone];
        copy.periodEnd = [self.periodEnd copyWithZone:zone];
    }
    
    return copy;
}


@end
