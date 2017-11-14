//
//  BaseRequestModel.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseRequestModel : NSObject<NSCoding, NSCopying>

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end
