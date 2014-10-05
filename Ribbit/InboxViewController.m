//
//  InboxViewController.m
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "InboxViewController.h"
#import "ImageViewController.h"
#import "MSCellAccessory.h"

@interface InboxViewController ()

@end

@implementation InboxViewController
{
    
  NSArray *Number;
    NSArray *Program;
    NSArray *SentProgram;
    NSNumber * SelectedNumber;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Patterns" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    Number = [dict objectForKey:@"Number"];
    Program = [dict objectForKey:@"Pattern"];

   // self.moviePlayer = [[MPMoviePlayerController alloc] init];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"Current user: %@", currentUser.username);
    }
    else {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(retrieveMessages) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    
    [self retrieveMessages];
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
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFObject *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = [message objectForKey:@"senderName"];
    
    UIColor *disclosureColor = [UIColor colorWithRed:0.553 green:0.439 blue:0.718 alpha:1.0];
    cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_DISCLOSURE_INDICATOR color:disclosureColor];
    
    cell.imageView.image = [UIImage imageNamed:@"icon_image"];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
self.selectedMessage = [self.messages objectAtIndex:indexPath.row];

UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
animatedImageView.animationImages = [NSArray arrayWithObjects:
                                     [UIImage imageNamed:@"program.png"],
                                     [UIImage imageNamed:@"blackscreen.png"],
                                     [UIImage imageNamed:@"blackscreen.png"],
                                     nil];

animatedImageView.animationDuration = 10.0f;
animatedImageView.animationRepeatCount = 1;
[animatedImageView startAnimating];
[self.view addSubview: animatedImageView];
    
    
    /*

   // self.selectedMessage = [self.messages objectAtIndex:indexPath.row];
    
   // NSNumber *sentPatternNumber = [self.selectedMessage objectForKey:@"Number"];
    
   // int myInt = [sentPatternNumber intValue];
    
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"Patterns" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    Program = [dict objectForKey:@"Pattern"];
    SentProgram = [Program objectAtIndex:myInt];

    NSLog(@"%@", sentPatternNumber);
    NSLog(@"%@", Program);

  // [self performSegueWithIdentifier:@"showImage" sender:self];
    
    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    animatedImageView.animationImages = [NSArray arrayWithObjects:
                                         
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:@"program.png"],
                                         [UIImage imageNamed:SentProgram[0]],
                                         [UIImage imageNamed:SentProgram[1]],
                                         [UIImage imageNamed:SentProgram[2]],
                                         [UIImage imageNamed:SentProgram[3]],
                                         [UIImage imageNamed:SentProgram[4]],
                                         [UIImage imageNamed:SentProgram[6]],
                                         [UIImage imageNamed:SentProgram[7]],
                                         [UIImage imageNamed:SentProgram[0]],
                                         [UIImage imageNamed:SentProgram[1]],
                                         [UIImage imageNamed:SentProgram[2]],
                                         [UIImage imageNamed:SentProgram[3]],
                                         [UIImage imageNamed:SentProgram[4]],
                                         [UIImage imageNamed:SentProgram[6]],
                                         [UIImage imageNamed:SentProgram[7]],
                                         [UIImage imageNamed:SentProgram[0]],
                                         [UIImage imageNamed:SentProgram[1]],
                                         [UIImage imageNamed:SentProgram[2]],
                                         [UIImage imageNamed:SentProgram[3]],
                                         [UIImage imageNamed:SentProgram[4]],
                                         [UIImage imageNamed:SentProgram[6]],
                                         [UIImage imageNamed:SentProgram[7]],
                                         [UIImage imageNamed:SentProgram[0]],
                                         [UIImage imageNamed:SentProgram[1]],
                                         [UIImage imageNamed:SentProgram[2]],
                                         [UIImage imageNamed:SentProgram[3]],
                                         [UIImage imageNamed:SentProgram[4]],
                                         [UIImage imageNamed:SentProgram[6]],
                                         [UIImage imageNamed:SentProgram[7]],
                                         [UIImage imageNamed:SentProgram[0]],
                                         [UIImage imageNamed:SentProgram[1]],
                                         [UIImage imageNamed:SentProgram[2]],
                                         [UIImage imageNamed:SentProgram[3]],
                                         [UIImage imageNamed:SentProgram[4]],
                                         [UIImage imageNamed:SentProgram[6]],
                                         [UIImage imageNamed:SentProgram[7]],
                                         [UIImage imageNamed:SentProgram[0]],
                                         [UIImage imageNamed:SentProgram[1]],
                                         [UIImage imageNamed:SentProgram[2]],
                                         [UIImage imageNamed:SentProgram[3]],
                                         [UIImage imageNamed:SentProgram[4]],
                                         [UIImage imageNamed:SentProgram[6]],
                                         [UIImage imageNamed:SentProgram[7]],



                                         
                                          nil];
    
    animatedImageView.animationDuration = 10.0f;
    animatedImageView.animationRepeatCount = 1;
    [animatedImageView startAnimating];
    [self.view addSubview: animatedImageView];
     */
    
    // Delete it!
    NSMutableArray *recipientIds = [NSMutableArray arrayWithArray:[self.selectedMessage objectForKey:@"recipientIds"]];
    NSLog(@"Recipients: %@", recipientIds);
     [self.selectedMessage deleteInBackground];
    
   // if ([recipientIds count] == 1) {
        // Last recipient - delete!
     //   [self.selectedMessage deleteInBackground];
   // }
    //else {
        // Remove the recipient and save
        //[recipientIds removeObject:[[PFUser currentUser] objectId]];
        //[self.selectedMessage setObject:recipientIds forKey:@"recipientIds"];
        //[self.selectedMessage saveInBackground];
    //}

}

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

//- (IBAction)howto:(id)sender {
//    [PFUser logOut];
//    [self performSegueWithIdentifier:@"showLogin" //sender:self];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
    else if ([segue.identifier isEqualToString:@"showImage"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
        ImageViewController *imageViewController = (ImageViewController *)segue.destinationViewController;
        imageViewController.message = self.selectedMessage;
    }
}

# pragma mark - Helper methods

- (void)retrieveMessages {
    PFQuery *query = [PFQuery queryWithClassName:@"PatternNumber"];
    [query whereKey:@"recipientIds" equalTo:[[PFUser currentUser] objectId]];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            // We found messages!
            self.messages = objects;
            [self.tableView reloadData];
            NSLog(@"Retrieved %d messages", [self.messages count]);
        }
        
        if ([self.refreshControl isRefreshing]) {
            [self.refreshControl endRefreshing];
        }
    }];
}

@end





