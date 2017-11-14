//
//  GetEventResponseModel.m
//
//  Created by   on 30/10/2017
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GetEventResponseModel.h"


NSString *const kGetEventResponseModelGetevent = @"getevent";


@interface GetEventResponseModel ()


@end

@implementation GetEventResponseModel

@synthesize getevent = _getevent;



- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super initWithDictionary:dict];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedGetevent = [dict objectForKey:kGetEventResponseModelGetevent];
    NSMutableArray *parsedGetevent = [NSMutableArray array];
    
    if ([receivedGetevent isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGetevent) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGetevent addObject:[Getevent modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGetevent isKindOfClass:[NSDictionary class]]) {
       [parsedGetevent addObject:[Getevent modelObjectWithDictionary:(NSDictionary *)receivedGetevent]];
    }

    self.getevent = [NSArray arrayWithArray:parsedGetevent];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:[super dictionaryRepresentation]];
    NSMutableArray *tempArrayForGetevent = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.getevent) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGetevent addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGetevent addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGetevent] forKey:kGetEventResponseModelGetevent];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}



#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    self.getevent = [aDecoder decodeObjectForKey:kGetEventResponseModelGetevent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];

    [aCoder encodeObject:_getevent forKey:kGetEventResponseModelGetevent];
}

- (id)copyWithZone:(NSZone *)zone {
    GetEventResponseModel *copy = [super copyWithZone:zone];
    
    if (copy) {
        copy.getevent = [self.getevent copyWithZone:zone];
    }
    
    return copy;
}


@end
