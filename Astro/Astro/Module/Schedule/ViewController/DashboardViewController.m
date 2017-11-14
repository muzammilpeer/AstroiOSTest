//
//  DashboardViewController.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()
@property (weak, nonatomic) IBOutlet UITableView *dashboardTableView;

@end

@implementation DashboardViewController


- (void)initObject {
    cell_identifier_table = @"DashboardTableViewCell";
    
    datasource = [NSMutableArray new];
    [datasource addObject:@"test1"];
    [datasource addObject:@"test2"];
    [datasource addObject:@"test3"];
    [datasource addObject:@"test4"];
    [datasource addObject:@"test5"];
}

- (void)initView {
    
}


@end
