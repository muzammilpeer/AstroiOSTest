//
//  BaseViewController.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerProtocol.h"
#import "BaseTableViewCell.h"
#import "BaseCollectionViewCell.h"
#import "AFNetworkReachabilityManager.h"


@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ViewControllerProtocol>
{
    @protected NSString *cell_identifier_table;
    @protected NSString *cell_identifier_collection;
    
    @protected NSMutableArray *datasource;
    @protected NSMutableArray *collectionDataSource;
}
- (void) saveContext;

@end
