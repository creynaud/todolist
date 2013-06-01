//
//  BBCreateTodoViewController.h
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBCreateTodoViewController : UITableViewController

@property (nonatomic, retain) IBOutlet UITableViewCell *todoTitleCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *todoDatePickerCell;

@end
