//
//  BaseResponseModel.h
//

#import <Foundation/Foundation.h>



@interface BaseResponseModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *responseMessage;
@property (nonatomic, strong) NSString *responseCode;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;


- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end
