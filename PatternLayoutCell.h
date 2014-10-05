//
//  PatternLayoutCell.h
//  Tribe
//
//  Created by Madison Maxey on 14/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatternLayoutCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *PatternNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ImageView;


@property (nonatomic, weak) NSString *PatternName;



@end
