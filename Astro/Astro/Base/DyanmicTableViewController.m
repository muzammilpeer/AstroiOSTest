//
//  DyanmicTableViewController.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "DyanmicTableViewController.h"
#import "LoadMoreTableViewCell.h"


@interface DyanmicTableViewController ()

@end

@implementation DyanmicTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    //set page to zero
    currentPage = 0;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (enableLoadMore == true) {
        if (indexPath.row == [datasource count]-1 &&  [datasource count] < totalRecords)
        {
            LoadMoreTableViewCell *cell = (LoadMoreTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LoadMoreTableViewCell"];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"LoadMoreTableViewCell" owner:self options:nil] firstObject];
            }
            if (cell) {
                cell.tag = indexPath.row;
                [cell updateCell:nil];
            }

            currentPage++;
            // method need to be implemented in child class
//            if ([self respondsToSelector:@selector(fetchTableViewDataInPagination)]) {
                [self fetchTableViewDataInPagination];
//            }
            return cell;
        }
    }
    
    DynamicRowModel *model = [datasource objectAtIndex:indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.rowCellIdentifier];
    
    if (cell) {
        cell.tag = indexPath.row;
        [cell updateCell:model];
    }
    return cell;


}


// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (enableLoadMore == true) {
        if (indexPath.row == [datasource count]-1 &&  [datasource count] < totalRecords)
        {
            return 120.0;
        }
    }

    
    DynamicRowModel *model  = [datasource objectAtIndex:indexPath.row];
    return [model rowHeight];
}

#pragma mark - UITableViewDelegate
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}




@end
