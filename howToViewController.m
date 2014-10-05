//
//  howToViewController.m
//  Tribe
//
//  Created by Madison Maxey on 04/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "howToViewController.h"


@interface howToViewController ()

@end

@implementation howToViewController


//- (id)initWithNibName:(NSString *)nibNil bundle:(NSBundle *)nibBundleOrNil
{
  //  self = [super initWithNibName:nibNil bundle:nibBundleOrNil];
   // if (self) {
        // Custom initialization
    }
  //  return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
 [self.navigationController.navigationBar setHidden:NO];
    
    
    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    animatedImageView.animationImages = [NSArray arrayWithObjects:
                                         [UIImage imageNamed:@"send.png"],
                                         [UIImage imageNamed:@"send.png"],
                                         [UIImage imageNamed:@"open.png"],
                                         [UIImage imageNamed:@"open.png"],
                                         [UIImage imageNamed:@"program.png"],
                                        [UIImage imageNamed:@"program.png"],
                                         nil];
    
    animatedImageView.animationDuration = 6.0f;
    animatedImageView.animationRepeatCount = 1;
    [animatedImageView startAnimating];
    [self.view addSubview: animatedImageView];
	
    //added from main image controller, but breaks code
   // PFFile *imageFile = [self.message objectForKey:@"file"];
   // NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
   // NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    //self.imageView.image = [UIImage imageWithData:imageData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
