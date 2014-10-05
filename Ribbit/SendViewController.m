

//
//  SendViewController.m
//  Tribe
//
//  Created by Madison Maxey on 14/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "SendViewController.h"
#import "PatternViewController.h"
#import "GravatarUrlBuilder.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "MSCellAccessory.h"


@interface SendViewController ()
{
    UIColor *disclosureColor;
    

}

@end

@implementation SendViewController {
    NSArray *Patterns;
    NSArray *Number;
}

@synthesize patternViewController;
@synthesize PatternNameLabel;
@synthesize selection;




- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PatternAdded"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        patternViewController = [navigationController viewControllers][0];
        patternViewController.delegate = self;
        
    }
    


    
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    self.recipients = [[NSMutableArray alloc] init];
     disclosureColor = [UIColor colorWithRed:0.553 green:0.439 blue:0.718 alpha:1.0];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self performSegueWithIdentifier:@"PatternAdded" sender:self];
    
    self.friendsRelation = [[PFUser currentUser] objectForKey:@"friendsRelation"];
    
    PFQuery *query = [self.friendsRelation query];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
        else {
            self.friends = objects;
            [self.tableView reloadData];
        }
    }];
   
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.friends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if ([self.recipients containsObject:user.objectId]) {
       cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_CHECKMARK color:disclosureColor];
    }
    else {
        cell.accessoryView = nil;
    }
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        // 1. Get email address
        NSString *email = [user objectForKey:@"email"];
        
        // 2. Create the md5 hash
        NSURL *gravatarUrl = [GravatarUrlBuilder getGravatarUrl:email];
        
        // 3. Request the image from Gravatar
        NSData *imageData = [NSData dataWithContentsOfURL:gravatarUrl];
        
        if (imageData != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                // 4. Set image in cell
                cell.imageView.image = [UIImage imageWithData:imageData];
                [cell setNeedsLayout];
            });
        }
    });
    
    cell.imageView.image = [UIImage imageNamed:@"icon_person"];
    
    return cell;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    PFUser *user = [self.friends objectAtIndex:indexPath.row];
    
    if (cell.accessoryView == nil) {
      cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_CHECKMARK color:disclosureColor];
        [self.recipients addObject:user.objectId];
    }
    else {
        cell.accessoryView = nil;
        [self.recipients removeObject:user.objectId];
    }
    
    NSLog(@"%@", self.recipients);
}



//- (IBAction)cancel:(id)sender {
  // [self reset];
    
    //[self.tabBarController setSelectedIndex:0];
//}

- (IBAction)send:(id)sender {
    
    
    NSLog(@"%@",selection);

    if (selection == nil) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Try again!"
                                                            message:@"Please capture or select a photo or video to share!"
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
       // [self presentViewController:self.imagePicker animated:NO completion:nil];
    }
    else {
        
        [self uploadMessage];
        
        [self.tabBarController setSelectedIndex:0];
    }
}

#pragma mark - PatternViewControllerDelegate

- (void)patternViewControllerDidCancel:(PatternViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tabBarController setSelectedIndex:0];
}

- (void)patternViewControllerDidSave:(PatternViewController *)controller
{
    
    NSLog(@"%@",patternViewController.PatternName);
    
    PatternNameLabel.text = patternViewController.PatternName;
    selection = patternViewController.selected;
    
     [self dismissViewControllerAnimated:YES completion:nil];
    

    

    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Helper methods

- (void)uploadMessage {
    
    NSString *selectionstring = [NSString stringWithFormat:@"%@", selection];

    NSData *data = [selectionstring dataUsingEncoding:NSUTF8StringEncoding];
    PFFile *selectedfile = [PFFile fileWithName:@"string.txt" data:data];


    
    
    [selectedfile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An error occurred!"
                                                                message:@"Please try sending your message again."
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
        
        
        else {
            PFObject * PatternNumber = [[PFObject alloc] initWithClassName:@"PatternNumber"];
            PatternNumber[@"PatternNumber"] = selectedfile;
            [PatternNumber setObject:selectedfile forKey:@"file"];
            [PatternNumber setObject:selection forKey:@"Number"];
            [PatternNumber setObject:self.recipients forKey:@"recipientIds"];
            [PatternNumber setObject:[[PFUser currentUser] objectId] forKey:@"senderId"];
            [PatternNumber setObject:[[PFUser currentUser] username] forKey:@"senderName"];
            [PatternNumber saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
               if (error) {
                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An error occurred!"
                                                                       message:@"Please try sending your message again."
                                                                       delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                   [alertView show];
                }
                
               else {
                   
                   
                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success!"
                                                                       message:@"You Rock!"
                                                                      delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                      [alertView show];

                       [selectedfile save];
               }
                
            }];
        }
    }];
}


@end






