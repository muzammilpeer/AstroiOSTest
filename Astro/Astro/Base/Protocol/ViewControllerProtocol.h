//
//  ViewControllerProtocol.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewControllerProtocol <NSObject>


@required
- (void) initObject;
- (void) initView;

@optional
- (void) initNetworkCall;
- (void) initListener;

//Pagination Supported methods
- (void) fetchTableViewDataInPagination;

@end

