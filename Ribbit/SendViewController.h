//
//  SendViewController.h
//  Tribe
//
//  Created by Madison Maxey on 14/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatternViewController.h"
#import <Parse/Parse.h>

@interface SendViewController : UITableViewController <PatternViewControllerDelegate >


@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, strong) PFRelation *friendsRelation;
@property (nonatomic, strong) NSMutableArray *recipients;

@property (nonatomic, strong) IBOutlet UILabel *PatternNameLabel;


@property (nonatomic, retain)  PatternViewController * patternViewController;
@property (nonatomic, strong)  NSNumber * selection;


//- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;


- (void)uploadMessage;

@end

