//
//  TVGuideViewController.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "TVGuideViewController.h"
#import "TvGuideDataSource.h"
#import "NetworkManager.h"
#import "TvGuideDBUtil.h"
#import "GetEventRequestModel.h"
#import "GetEventResponseModel.h"

@interface TVGuideViewController ()
{
    NSString *sortKey;
    NSDate *currentDateTime;
}
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *programTimeView;

@property (weak, nonatomic) IBOutlet UITableView *tvGuideTableView;
@property (weak, nonatomic) IBOutlet UILabel *programTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *sortyBySegmentControl;
@end

@implementation TVGuideViewController

- (void)initObject {
    currentPage = 0;
    cell_identifier_table = @"DashboardTableViewCell";
    enableLoadMore = true;
    
    [self.loadingView setHidden:false];
    [self.tvGuideTableView setHidden:true];
    
    datasource = [NSMutableArray new];
    
    currentDateTime = [NSDate new];
    
    NSTimeInterval secondsInEightHours = 1 * 60 * 60;
    NSDate *dateEightHoursAhead = [currentDateTime dateByAddingTimeInterval:secondsInEightHours];

    
    self.durationLabel.text = [NSString stringWithFormat:@"Period : %@ - %@",[self getStartPeriodTime:currentDateTime],[self getEndPeriodTime:dateEightHoursAhead]];
    
    self.programTimeLabel.text = [NSString stringWithFormat:@"Current DateTime : %@",[self getCurrentTimeFormated:currentDateTime]];

    
    if (self.sortyBySegmentControl.selectedSegmentIndex == 0) {
        sortKey = @"channelName";
    }else {
        sortKey = @"stbNo";
    }
}

- (void)initView {
    self.programTimeView.layer.cornerRadius = 5;
}

- (void)initNetworkCall
{
    [NetworkManager execute:GET withRequestUri:URI_GET_CHANNEL_LIST withParameters:nil successBlock:^(REQUEST_METHOD requestMethod, BaseRequestModel *request, id response) {
        //Save in database
        [TvGuideDBUtil saveChannels:[GetChannelListResponseModel modelObjectWithDictionary:response]];
        [self saveContext];
        totalRecords = [TvGuideDBUtil getChannelsCount];
        
        [self fetchScheduleDataFromServer];
    } failureBlock:^(REQUEST_METHOD requestMethod, BaseRequestModel *request, BaseNetworkError *error) {
        NSLog(@"failureBlock");
    }];
}


- (NSString*) getCurrentTimeFormated:(NSDate*)currentDateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    return [dateFormatter stringFromDate:currentDateTime];
}

- (NSString*) getStartPeriod:(NSDate*)currentDateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:00"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    return [dateFormatter stringFromDate:currentDateTime];
}

- (NSString*) getEndPeriod:(NSDate*)currentDateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:00"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    return [dateFormatter stringFromDate:currentDateTime];
}


- (NSString*) getStartPeriodTime:(NSDate*)currentDateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [dateFormatter setDateFormat:@"HH:00"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    return [dateFormatter stringFromDate:currentDateTime];
}

- (NSString*) getEndPeriodTime:(NSDate*)currentDateTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [dateFormatter setDateFormat:@"HH:00"];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    return [dateFormatter stringFromDate:currentDateTime];
}


- (void) fetchScheduleDataFromServer
{
    NSMutableArray *listOfChannels = [TvGuideDBUtil getChannelIdsPaginated:currentPage withPageSize:CHANNEL_LIST_PAGE_SIZE withSorting:sortKey];
    NSString *channelIds = @"";
    
    NSTimeInterval secondsInEightHours = 1 * 60 * 60;
    NSDate *dateEightHoursAhead = [currentDateTime dateByAddingTimeInterval:secondsInEightHours];
    
    NSString *periodStart = [self getStartPeriod:currentDateTime];
    NSString *periodEnd = [self getEndPeriod:dateEightHoursAhead];

    if (listOfChannels.count > 0) {
        channelIds = [listOfChannels componentsJoinedByString:@","];
    }
    
    GetEventRequestModel *request = [GetEventRequestModel new];
    request.channelId = channelIds;
    request.periodEnd = periodEnd;
    request.periodStart = periodStart;
    
    [NetworkManager execute:GET withRequestUri:URI_GET_EVENTS withParameters:request successBlock:^(REQUEST_METHOD requestMethod, BaseRequestModel *request, id response) {
        
        [datasource addObjectsFromArray: [TvGuideDataSource generateTvGuideDataSource:[GetEventResponseModel modelObjectWithDictionary:response] withPageNo:currentPage withPageSize:CHANNEL_LIST_PAGE_SIZE withSort:sortKey]];
        [self.tvGuideTableView reloadData];
        
        [self.loadingView setHidden:true];
        [self.tvGuideTableView setHidden:false];
    } failureBlock:^(REQUEST_METHOD requestMethod, BaseRequestModel *request, BaseNetworkError *error) {
        NSLog(@"failureBlock");
    }];
    
    
}


//Method implemented for pagination support (Check parent class for it)
- (void) fetchTableViewDataInPagination
{
    [self fetchScheduleDataFromServer];
}

- (IBAction)actionSortBy:(id)sender {
    if (self.sortyBySegmentControl.selectedSegmentIndex == 0) {
        sortKey = @"channelName";
    }else {
        sortKey = @"stbNo";
    }
    
    [datasource removeAllObjects];
    [self.tvGuideTableView reloadData];
    
    [self.loadingView setHidden:false];
    [self.tvGuideTableView setHidden:true];

    currentPage = 0;
    [self fetchScheduleDataFromServer];

}

#pragma mark - UITableViewDelegate
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    

    if ([[datasource objectAtIndex:indexPath.row] isKindOfClass:[DynamicRowModel class]]) {
        DynamicRowModel *model = [datasource objectAtIndex:indexPath.row];
        
        if ([[model metaData] isKindOfClass:[ChannelEntity class]]) {
            ChannelEntity *entity = [model metaData];
            
            
            entity.isFavourite = entity.isFavourite == true ? false : true ;
            [self saveContext];
            
            
            
            NSString *message  = @"";
            if (entity.isFavourite == true) {
                message = [NSString stringWithFormat:@"%@ is added in favourite list.",model.rowTitle];
            }else {
                message = [NSString stringWithFormat:@"%@ is removed in favourite list.",model.rowTitle];
            }
            
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Favourite" message:message preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.tvGuideTableView reloadData];
            }];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:YES completion:nil];

        }
    }
    
    
}




@end
