//
//  DashboardTableViewCell.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "DashboardTableViewCell.h"

@interface DashboardTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation DashboardTableViewCell

- (void)updateCell:(id)model {
    self.titleLabel.text = model;
}


@end
