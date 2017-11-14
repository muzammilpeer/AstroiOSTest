//
//  ChannelTableViewCell.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "ChannelTableViewCell.h"
#import "DynamicRowModel.h"
#import "ProgramScheduleModel.h"
#import "UIImageView+AFNetworking.h"
#import "ChannelEntity.h"

@interface ChannelTableViewCell()

@property (weak, nonatomic) IBOutlet UITableView *programTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintTableViewHegith;


@property (weak, nonatomic) IBOutlet UILabel *stbNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *channelImageView;
@property (weak, nonatomic) IBOutlet UILabel *channelLabel;

@property (weak, nonatomic) IBOutlet UIImageView *favouriteImageView;

@end

@implementation ChannelTableViewCell

-(void)awakeFromNib
{
    [super awakeFromNib];

    cell_identifier_table = @"ProgramTableViewCell";
    
}

- (void)updateCell:(id)model {
    
    if ([model isKindOfClass:[DynamicRowModel class]]) {
        
        self.stbNumberLabel.text = [NSString stringWithFormat:@"  %.0f  ",[model rowID]];
        
        self.stbNumberLabel.layer.cornerRadius = 5;
        self.stbNumberLabel.layer.masksToBounds = false;
        self.stbNumberLabel.clipsToBounds = true;
//        https://astrocontent.s3.amazonaws.com/Images/ChannelLogo/Pos/411_51.png
        NSString *imageURL = [NSString stringWithFormat:@"https://astrocontent.s3.amazonaws.com/Images/ChannelLogo/Pos/%.0f_51.png",[model rowID]];
        
        [self.channelImageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"placeholder_tv"]];
        
        self.channelLabel.text = [model rowTitle];
        
        datasource = nil;
        ProgramScheduleModel *rawData = [model rawData];
        datasource = rawData.programList;
        self.constraintTableViewHegith.constant = rawData.fullHeight;
        [self.programTableView updateConstraintsIfNeeded];
        [self.programTableView reloadData];
        
        
        if ([[model metaData] isKindOfClass:[ChannelEntity class]]) {
            ChannelEntity *entity = [model metaData];
            self.favouriteImageView.image = [UIImage imageNamed:entity.isFavourite == true ? @"ic_favorite_48pt" : @"ic_favorite_border_48pt"];
            
        }

        
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
    DynamicRowModel *model = [datasource objectAtIndex:indexPath.row];
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_identifier_table];
    
    if (cell) {
        cell.tag = indexPath.row;
        [cell updateCell:model];
    }
    return cell;
}


// Variable height support
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}


@end
