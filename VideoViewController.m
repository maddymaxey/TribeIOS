//
//  VideoViewController.m
//  Tribe
//
//  Created by Madison Maxey on 13/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "VideoViewController.h"
#import "ModalViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

@synthesize showDefaultButton, showFlipButton;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

- (IBAction)showDefault:(id)sender {
    ModalViewController *modalView = [[ModalViewController alloc] init] ;
    [self presentModalViewController:modalView animated:NO];
}

- (IBAction)showFlip:(id)sender {
    ModalViewController *modalView = [[ModalViewController alloc] init] ;
    [modalView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:modalView animated:NO];
}



//- (void)dealloc {
  //  [showDefaultButton release];
    //[showFlipButton release];
    //[super dealloc];
//}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


@end
