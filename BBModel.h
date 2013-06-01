//
//  BBModel.h
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBTodo.h"

@interface BBModel : NSObject

+ (id)sharedModel;

- (NSArray *)todos;
- (NSArray *)todosOverdue;
- (NSArray *)todosForToday;
- (NSArray *)todosForTomorrow;
- (NSArray *)todosForLater;
- (void)addTodo:(BBTodo *)todo;
- (void)removeTodo:(BBTodo *)todo;

- (NSArray *)recents;
- (void)updateRecents:(BBTodo *)todo;

@end
