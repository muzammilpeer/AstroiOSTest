//
//  ProgramTableViewCell.m
//  Astro
//
//  Created by Muzammil Peer on 28/10/2017.
//  Copyright © 2017 Muzammil Peer. All rights reserved.
//

#import "ProgramTableViewCell.h"
#import "DynamicRowModel.h"
#import "Getevent.h"

@interface ProgramTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;


@end

@implementation ProgramTableViewCell

- (void)updateCell:(id)model {
    
    
    if ([model isKindOfClass:[DynamicRowModel class]]) {
        
        if ( [[model rawData] isKindOfClass:[Getevent class]]) {
            Getevent *program = [model rawData];
            self.titleLabel.text = [NSString stringWithFormat:@"%@ : %@",[self getDateFormat:program.displayDateTime],program.programmeTitle];
            self.subtitleLabel.text = program.shortSynopsis;
        }else if ( [[model rawData] isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *program = [model rawData];
            self.titleLabel.text = program[@"key"];
            self.subtitleLabel.text = program[@"value"];
        }
        
    }
}

//2017-10-30 13:30:00.0
- (NSString*) getDateFormat:(NSString*)displayDate
{
    NSDateFormatter *fromDateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [fromDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [fromDateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    NSDateFormatter *toDateFormatter = [[NSDateFormatter alloc] init];
    //YYYY-MM-DD HH:MM
    [toDateFormatter setDateFormat:@"HH:mm"];
    [toDateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    NSDate *fromDate = [fromDateFormatter dateFromString:displayDate];
    return [toDateFormatter stringFromDate:fromDate];
}



@end
