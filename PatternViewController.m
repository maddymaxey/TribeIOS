//
//  PatternViewController.m
//  Tribe
//
//  Created by Madison Maxey on 14/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "PatternViewController.h"
#import "PatternLayoutCell.h"
//#import "SendViewController.h"



@interface PatternViewController ()

@end

@implementation PatternViewController

{
    
    NSArray *Number;
    NSArray *Patterns;
    NSArray *Image;
    NSArray *Program;
    UIAlertView *ViewAlert;

}

//@synthesize tableView;
@synthesize selected;
@synthesize PatternName;



- (id)initWithStyle:(UITableViewStyle)style
{
    
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Patterns" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    Number = [dict objectForKey:@"Number"];
    Patterns = [dict objectForKey:@"PatternName"];
    Image = [dict objectForKey:@"Image"];
    Program = [dict objectForKey:@"Program"];
   
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [Patterns count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *PatternIdentifier = @"PatternLayoutCell";
        
        PatternLayoutCell *cell = (PatternLayoutCell *) [tableView dequeueReusableCellWithIdentifier:PatternIdentifier];
        
        if (cell == nil)
        
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PatternLayoutCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
       cell.PatternNameLabel.text = [Patterns objectAtIndex:indexPath.row];
        cell.ImageView.image = [UIImage imageNamed:[self->Image objectAtIndex:indexPath.row]];
        

        return cell;
    }



- (IBAction)cancel:(id)sender
{
    [self.delegate patternViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender
{
    
//    [self.delegate patternViewControllerDidSave:self];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)alertView:(UIAlertView *)ViewAlert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 1)
    {
        
        NSLog(@"%@", selected);
        NSLog(@"%@", PatternName);
        [self.delegate patternViewControllerDidSave:self];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   selected = [Number objectAtIndex:indexPath.row];
   PatternName = [Patterns objectAtIndex:indexPath.row];
    ViewAlert = [[UIAlertView alloc] initWithTitle:PatternName message:@"Send Now?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: @"Yes", nil];
    
   // self.selected = [Number objectAtIndex:indexPath.row];
    
[ViewAlert show];

    
}

@end
