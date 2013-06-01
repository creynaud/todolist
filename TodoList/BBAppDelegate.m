//
//  BBAppDelegate.m
//  TodoList
//
//  Created by Claire Reynaud on 5/27/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBAppDelegate.h"
#import "BBTodosTableViewController.h"
#import "BBAboutViewController.h"
#import "BBRecentsTableViewController.h"

@implementation BBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    NSMutableArray *tabControllers = [NSMutableArray array];
    
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    
    // Todos
    BBTodosTableViewController *todosTableViewController = [[BBTodosTableViewController alloc] initWithNibName:@"BBTodosTableViewController" bundle:nil];
    UINavigationController *todosNavigationController = [[UINavigationController alloc] initWithRootViewController:todosTableViewController];
    todosNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedStringFromTable(@"Todos", @"Application", nil) image:[UIImage imageNamed:@"Todos"] tag:0];
    [tabControllers addObject:todosNavigationController];
    
    // Recents
    BBRecentsTableViewController *recentsTableViewController = [[BBRecentsTableViewController alloc] initWithNibName:@"BBRecentsTableViewController" bundle:nil];
    UINavigationController *recentsNavigationController = [[UINavigationController alloc] initWithRootViewController:recentsTableViewController];
    recentsNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:1];
    [tabControllers addObject:recentsNavigationController];

    // About
    BBAboutViewController *aboutViewController = [[BBAboutViewController alloc] initWithNibName:@"BBAboutViewController" bundle:nil];
    UINavigationController *aboutNavigationController = [[UINavigationController alloc] initWithRootViewController:aboutViewController];
    aboutNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedStringFromTable(@"About", @"Application", nil) image:[UIImage imageNamed:@"About"] tag:2];
    [tabControllers addObject:aboutNavigationController];
    
    tabBarController.viewControllers = tabControllers;
    tabBarController.selectedViewController = todosNavigationController;
    
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
