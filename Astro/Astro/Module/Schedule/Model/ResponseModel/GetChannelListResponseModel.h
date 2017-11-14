//
//  GetChannelListResponseModel.h
//

#import <Foundation/Foundation.h>
#import "BaseResponseModel.h"
#import "Channels.h"


@interface GetChannelListResponseModel : BaseResponseModel

@property (nonatomic, strong) NSArray *channels;

@end
