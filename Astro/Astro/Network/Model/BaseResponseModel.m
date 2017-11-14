//
//  BaseResponseModel.m
//

#import "BaseResponseModel.h"


NSString *const kBaseResponseModelResponseMessage = @"responseMessage";
NSString *const kBaseResponseModelResponseCode = @"responseCode";


@interface BaseResponseModel ()

@end

@implementation BaseResponseModel

@synthesize responseMessage = _responseMessage;
@synthesize responseCode = _responseCode;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    self.responseMessage = [self objectOrNilForKey:kBaseResponseModelResponseMessage fromDictionary:dict];
    self.responseCode = [self objectOrNilForKey:kBaseResponseModelResponseCode fromDictionary:dict];

    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForChannels = [NSMutableArray array];
    
    [mutableDict setValue:self.responseMessage forKey:kBaseResponseModelResponseMessage];
    [mutableDict setValue:self.responseCode forKey:kBaseResponseModelResponseCode];

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

    self.responseMessage = [aDecoder decodeObjectForKey:kBaseResponseModelResponseMessage];
    self.responseCode = [aDecoder decodeObjectForKey:kBaseResponseModelResponseCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_responseMessage forKey:kBaseResponseModelResponseMessage];
    [aCoder encodeObject:_responseCode forKey:kBaseResponseModelResponseCode];
}

- (id)copyWithZone:(NSZone *)zone {
    BaseResponseModel *copy = [[BaseResponseModel alloc] init];
    if (copy) {

        copy.responseMessage = [self.responseMessage copyWithZone:zone];
        copy.responseCode = [self.responseCode copyWithZone:zone];
    }
    
    return copy;
}


@end
