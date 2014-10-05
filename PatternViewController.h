//
//  PatternViewController.h
//  Tribe
//
//  Created by Madison Maxey on 14/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import <UIKit/UIKit.h>




@class PatternViewController;



@protocol PatternViewControllerDelegate <NSObject>

- (void)patternViewControllerDidCancel:(PatternViewController *)controller;
- (void)patternViewControllerDidSave:(PatternViewController *)controller;

@end

@interface PatternViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>


@property (nonatomic, strong) id <PatternViewControllerDelegate> delegate;
@property (nonatomic, strong) NSNumber *selected;
@property (nonatomic, strong) NSString *PatternName;

@property (nonatomic, strong) IBOutlet UITableView *tableView;


- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end

