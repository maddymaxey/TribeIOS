//
//  TutorialViewController.m
//  Tribe
//
//  Created by Madison Maxey on 17/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
   self.Tutorialname = [NSString stringWithFormat:@"screen%d.png", self.index];

    _ImageView.image = [UIImage imageNamed:_Tutorialname];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
