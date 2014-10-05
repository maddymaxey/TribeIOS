//
//  PatternLayoutCell.m
//  Tribe
//
//  Created by Madison Maxey on 14/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "PatternLayoutCell.h"

@implementation PatternLayoutCell

@synthesize PatternNameLabel = _PatternNameLabel;
@synthesize  ImageView = _ImageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
