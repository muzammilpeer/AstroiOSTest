//
//  Channels.h
//

#import <Foundation/Foundation.h>



@interface Channels : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double channelId;
@property (nonatomic, strong) NSString *channelTitle;
@property (nonatomic, assign) double channelStbNumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
