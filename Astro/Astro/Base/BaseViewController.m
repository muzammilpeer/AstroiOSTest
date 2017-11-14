//
//  BaseViewController.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "BaseViewController.h"
#import <MagicalRecord/MagicalRecord.h>


@interface BaseViewController ()

@end

@implementation BaseViewController



-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    //start monitioring network state
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];

    [self setupViewController];
}

/**
 Abstraction for Setting up ViewController initally
 
 Required:
 1)initObjects() ,
 2)initViews(),
 
 Optional:
 3)initNetworkCalls() ,
 4)initListeners()
 */
- (void) setupViewController
{
    //required methods
    [self initObject];
    [self initView];
    
    //these are optional methods
    if ([self respondsToSelector:@selector(initNetworkCall)]) {
        [self initNetworkCall];
    }
    if ([self respondsToSelector:@selector(initListener)]) {
        [self initListener];
    }
}




#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_identifier_table];
    
    if (cell) {
        cell.tag = indexPath.row;
        [cell updateCell:[datasource objectAtIndex:indexPath.row]];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma --mark CollectionViewDelegateAndDataSource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section
{
    return [collectionDataSource count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:cell_identifier_collection forIndexPath:indexPath];
    if (cell) {
        [cell updateCell:[collectionDataSource objectAtIndex:indexPath.row]];
    }
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    NSLog(@"%ld", (long)indexPath.row);
}

#pragma mark - Magical record - Core data
//#####################################################################
/// Save data in database to file
- (void) saveContext
{
    [NSManagedObjectContext.MR_defaultContext MR_saveToPersistentStoreAndWait];
}
//#####################################################################


@end
