//
//  AlertViewController.m
//  Tribe
//
//  Created by Madison Maxey on 18/02/14.
//  Copyright (c) 2014 Crated. All rights reserved.
//

#import "AlertViewController.h"
#import "PatternViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)alertAction{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"heyhey!" message:@"Send Now?"delegate:self cancelButtonTitle:@"OK" otherButtonTitles: @"send", nil];
    
    [alertView show];
    //[testAlert release];
    

        
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Ok"]) { alertLabel.text = @"Clicked Bad";
    }
    else { alertLabel.text = @"Clicked Send";
    }

    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
