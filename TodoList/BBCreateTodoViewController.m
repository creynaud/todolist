//
//  BBCreateTodoViewController.m
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBCreateTodoViewController.h"

@interface BBCreateTodoViewController ()

@end

@implementation BBCreateTodoViewController

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

    self.title = NSLocalizedStringFromTable(@"AddTodo", @"Application", nil);

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)done
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return NSLocalizedStringFromTable(@"Description", @"Application", nil);
    } else if (section == 1) {
        return NSLocalizedStringFromTable(@"DueDate", @"Application", nil);
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *CellIdentifierTitle = @"TodoTitleCell";
    static NSString *CellIdentifierDate = @"TodoDatePickerCell";
    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierTitle];
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"BBTodoTitleTableViewCell" owner:self options:nil];
            cell = self.todoTitleCell;
            self.todoTitleCell = nil;
        }
    } else if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierDate];
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"BBTodoDateTableViewCell" owner:self options:nil];
            cell = self.todoDatePickerCell;
            self.todoDatePickerCell = nil;
        }
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
