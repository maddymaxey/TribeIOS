//
//  NumberCell.h
//  Tribe
//
//  Created by Madison Maxey on 06/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *label;
- (void)setNumber:(NSInteger)number;

@property (nonatomic, strong) NSString *imageName;
-(void)updateCell;

@end
