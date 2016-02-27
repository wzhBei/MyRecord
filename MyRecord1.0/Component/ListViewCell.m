//
//  HomeTableViewCell.m
//  MyRecord1.0
//
//  Created by wzhnopc on 16/2/4.
//  Copyright © 2016年 wzhnopc. All rights reserved.
//

#import "ListViewCell.h"

@implementation ListViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initFromNib
{
    self = [super init];
    NSArray *subViews = [[NSBundle mainBundle] loadNibNamed:@"ListViewCell" owner:self options:nil];
    if (subViews.count > 0) {
        self = [subViews firstObject];
    }
    return self;
}
@end
