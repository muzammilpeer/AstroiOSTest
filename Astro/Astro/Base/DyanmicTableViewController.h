//
//  DyanmicTableViewController.h
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "BaseViewController.h"
#import "DynamicRowModel.h"

@interface DyanmicTableViewController : BaseViewController
{
    //Pagination support
    @protected bool enableLoadMore;
    @protected int totalRecords;
    @protected int currentPage;
}

@end
