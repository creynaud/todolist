//
//  BBTodosTableViewController.m
//  TodoList
//
//  Created by Claire Reynaud on 5/27/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBTodosTableViewController.h"
#import "BBCreateTodoViewController.h"
#import "BBModel.h"
#import "BBDateUtils.h"

#define OVERDUE_SECTION 0
#define TODAY_SECTION 1
#define TOMORROW_SECTION 2
#define LATER_SECTION 3

@interface BBTodosTableViewController ()

@end

@implementation BBTodosTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"Todos", nil);

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [[self tableView] reloadData];
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
        case OVERDUE_SECTION:
            return NSLocalizedString(@"Overdue", nil);
        case TODAY_SECTION:
            return NSLocalizedString(@"Today", nil);
        case TOMORROW_SECTION:
            return NSLocalizedString(@"Tomorrow", nil);
        case LATER_SECTION:
            return NSLocalizedString(@"Later", nil);
        default:
            return nil;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BBModel *model = [BBModel sharedModel];
    switch (section) {
        case OVERDUE_SECTION:
            return [[model todosOverdue] count];
        case TODAY_SECTION:
            return [[model todosForToday] count];
        case TOMORROW_SECTION:
            return [[model todosForTomorrow] count];
        case LATER_SECTION:
            return [[model todosForLater] count];
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    BBTodo *todo = nil;
    BBModel *model = [BBModel sharedModel];
    switch (indexPath.section) {
        case OVERDUE_SECTION:
            todo = [[model todosOverdue] objectAtIndex:indexPath.row];
            break;
        case TODAY_SECTION:
            todo = [[model todosForToday] objectAtIndex:indexPath.row];
            break;
        case TOMORROW_SECTION:
            todo = [[model todosForTomorrow] objectAtIndex:indexPath.row];
            break;
        case LATER_SECTION:
            todo = [[model todosForLater] objectAtIndex:indexPath.row];
            break;
        default:
            return nil;
    }

    // Configure the cell...
    cell.textLabel.text = todo.description;
    cell.userInteractionEnabled = YES;

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BBTodo *todo = nil;
        BBModel *model = [BBModel sharedModel];
        switch (indexPath.section) {
            case OVERDUE_SECTION:
                todo = [[model todosOverdue] objectAtIndex:indexPath.row];
                break;
            case TODAY_SECTION:
                todo = [[model todosForToday] objectAtIndex:indexPath.row];
                break;
            case TOMORROW_SECTION:
                todo = [[model todosForTomorrow] objectAtIndex:indexPath.row];
                break;
            case LATER_SECTION:
                todo = [[model todosForLater] objectAtIndex:indexPath.row];
                break;
            default:
                return;
        }
        [model removeTodo:todo];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Do nothing for now
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
