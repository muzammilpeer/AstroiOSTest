//
//  CellProtocol.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellProtocol <NSObject>

@required
-(void)updateCell:(id)model;

@end
