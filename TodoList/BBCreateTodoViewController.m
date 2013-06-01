//
//  BBCreateTodoViewController.m
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "BBCreateTodoViewController.h"
#import "BBModel.h"

#define DATE_SECTION 0
#define DESCRIPTION_SECTION 1

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
    UITableViewCell *descriptionCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:DESCRIPTION_SECTION]];
    UITextField *descriptionTextField = (UITextField *) [descriptionCell viewWithTag:1];
    NSString *description = descriptionTextField.text;

    UITableViewCell *dateCell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:DATE_SECTION]];
    UIDatePicker *datePicker = (UIDatePicker *) [dateCell viewWithTag:1];
    NSDate *date = datePicker.date;

    BBTodo *todo = [[BBTodo alloc] init];
    todo.description = description;
    todo.dueDate = date;
    [[BBModel sharedModel] addTodo:todo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == DATE_SECTION) {
        return NSLocalizedStringFromTable(@"DueDate", @"Application", nil);
    } else if (section == DESCRIPTION_SECTION) {
        return NSLocalizedStringFromTable(@"Description", @"Application", nil);
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == DATE_SECTION) {
        return 217;
    } else if (indexPath.section == DESCRIPTION_SECTION) {
        return 90;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    static NSString *CellIdentifierTitle = @"TodoTitleCell";
    static NSString *CellIdentifierDate = @"TodoDatePickerCell";
    UITableViewCell *cell = nil;
    if (indexPath.section == DATE_SECTION) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierTitle];
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"BBTodoDateTableViewCell" owner:self options:nil];
            cell = self.todoDatePickerCell;
            self.todoDatePickerCell = nil;
        }
    } else if (indexPath.section == DESCRIPTION_SECTION) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierDate];
        if (cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"BBTodoTitleTableViewCell" owner:self options:nil];
            cell = self.todoTitleCell;
            self.todoTitleCell = nil;
            UITextView *textView = (UITextView *)[cell viewWithTag:1];
            textView.layer.borderColor = [UIColor blackColor].CGColor;
            textView.layer.borderWidth = 1.0;
        }
    }
    cell.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
