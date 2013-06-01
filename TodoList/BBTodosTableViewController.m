//
//  BBTodosTableViewController.m
//  TodoList
//
//  Created by Claire Reynaud on 5/27/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBTodosTableViewController.h"
#import "BBTodoDetailViewController.h"
#import "BBCreateTodoViewController.h"

@interface BBTodosTableViewController ()

@end

@implementation BBTodosTableViewController

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

    self.title = NSLocalizedStringFromTable(@"Todos", @"Application", nil);

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)add
{
    BBCreateTodoViewController *createTodoViewController = [[BBCreateTodoViewController alloc] initWithNibName:@"BBCreateTodoViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:createTodoViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return NSLocalizedStringFromTable(@"Overdue", @"Application", nil);
        case 1:
            return NSLocalizedStringFromTable(@"Today", @"Application", nil);
        case 2:
            return NSLocalizedStringFromTable(@"Tomorrow", @"Application", nil);
        case 3:
            return NSLocalizedStringFromTable(@"Later", @"Application", nil);
        default:
            return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...
    cell.textLabel.text = @"A todo task";
    cell.detailTextLabel.text = @"2pm";
    cell.userInteractionEnabled = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

// Override to support conditional editing of the table view.
/* - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
} */

// Override to support editing the table view.
/* - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
} */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BBTodoDetailViewController *detailViewController = [[BBTodoDetailViewController alloc] initWithNibName:@"BBTodoDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
