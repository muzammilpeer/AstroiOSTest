//
//  DynamicRowModel.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicRowModel : NSObject

@property (nonatomic, assign) double rowID;
@property (nonatomic, assign) double rowSubId;
@property (nonatomic, strong) id metaData;

@property (nonatomic, strong) NSString *rowCellIdentifier;
@property (nonatomic, strong) id rawData;
@property (nonatomic, assign) double rowHeight;

@property (nonatomic, strong) NSString *rowTitle;
@property (nonatomic, strong) NSString *rowSubTitle;
@property (nonatomic, strong) NSString *rowPlaceHolder;

@end
