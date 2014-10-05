//
//  AppDelegate.m
//  Ribbit
//
//  Copyright (c) 2013 Treehouse. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NSThread sleepForTimeInterval:1.5];
    
    [Parse setApplicationId:@"jCyRfMVSZNJf6yiK6TvNOdAUxqXjCkpZ88o1muEg"
                  clientKey:@"iBqm7GJX9IkkAbJjFCoPJoFO18dWrNLwJl6KWg5b"];
    
    [self customizeUserInterface];
    
    return YES;
}


#pragma mark - Helper methods

- (void)customizeUserInterface {
    // Customize the nav bar
    //[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.553 green:0.435 blue:0.718 alpha:1.0]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navBarBackground"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // Customize the tab bar
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, nil] forState:UIControlStateNormal];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    
    UITabBarItem *tabInbox = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabFriends = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabCamera = [tabBar.items objectAtIndex:2];
    
    [tabInbox setFinishedSelectedImage:[UIImage imageNamed:@"inbox"] withFinishedUnselectedImage:[UIImage imageNamed:@"inbox"]];
    [tabFriends setFinishedSelectedImage:[UIImage imageNamed:@"friends"] withFinishedUnselectedImage:[UIImage imageNamed:@"friends"]];
    [tabCamera setFinishedSelectedImage:[UIImage imageNamed:@"camera"] withFinishedUnselectedImage:[UIImage imageNamed:@"camera"]];
}

@end









