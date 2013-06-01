//
//  BBModel.m
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBModel.h"

#define MAX_RECENTS 10

@interface BBModel ()

@property (strong) NSMutableArray *allTodos;
@property (strong) NSMutableArray *allRecents;

@end

@implementation BBModel

- (id)init {
    self = [super init];
    if (self) {
        self.allTodos = [NSMutableArray array];
        self.allRecents = [NSMutableArray array];
    }
    return self;
}


+ (id)sharedModel {
    static BBModel *sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}

- (NSArray *)todos
{
    return [NSArray arrayWithArray:self.allTodos];
}

+ (NSDate *)dayAfterToday:(NSUInteger)offset
{
    // start by retrieving day, weekday, month and year components for yourDate
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *todayComponents = [gregorian components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit) fromDate:[NSDate date]];
    NSInteger theDay = [todayComponents day];
    NSInteger theMonth = [todayComponents month];
    NSInteger theYear = [todayComponents year];
    
    // now build a NSDate object for yourDate using these components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:theDay];
    [components setMonth:theMonth];
    [components setYear:theYear];
    NSDate *thisDate = [gregorian dateFromComponents:components];
    
    // now build a NSDate object for the next day
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:offset];
    NSDate *nextDate = [gregorian dateByAddingComponents:offsetComponents toDate:thisDate options:0];
    return nextDate;
}

+ (NSDate *)tomorrow
{
    return [BBModel dayAfterToday:1];
}

+ (NSDate *)dayAfterTomorrow
{
    return [BBModel dayAfterToday:2];
}

- (NSArray *)todosOverdue
{
    return [self.allTodos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(BBTodo *todo, NSDictionary *bindings) {
        return [todo.dueDate compare:[NSDate date]] == NSOrderedAscending;
    }]];
}

- (NSArray *)todosForToday {
    NSDate *tomorrow = [BBModel tomorrow];
    return [self.allTodos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(BBTodo *todo, NSDictionary *bindings) {
        return [todo.dueDate compare:[NSDate date]] == NSOrderedDescending && [todo.dueDate compare:tomorrow] == NSOrderedAscending;
    }]];
}


- (NSArray *)todosForTomorrow {
    NSDate *tomorrow = [BBModel tomorrow];
    NSDate *dayAfterTomorrow = [BBModel dayAfterTomorrow];
    return [self.allTodos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(BBTodo *todo, NSDictionary *bindings) {
        return [todo.dueDate compare:tomorrow] == NSOrderedDescending && [todo.dueDate compare:dayAfterTomorrow] == NSOrderedAscending;
    }]];
}

- (NSArray *)todosForLater {
    NSDate *dayAfterTomorrow = [BBModel dayAfterTomorrow];
    return [self.allTodos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(BBTodo *todo, NSDictionary *bindings) {
        return [todo.dueDate compare:dayAfterTomorrow] == NSOrderedDescending;
    }]];
}

- (void)addTodo:(BBTodo *)todo
{
    [self.allTodos addObject:todo];
    [self updateRecents:todo];
}

- (void)removeTodo:(BBTodo *)todo
{
    [self.allTodos removeObject:todo];
    [self.allRecents removeObject:todo];
}

- (NSArray *)recents
{
    return [NSArray arrayWithArray:self.allRecents];
}

- (void)updateRecents:(BBTodo *)todo
{
    if ([self.allRecents count] >= MAX_RECENTS) {
        [self.allRecents removeLastObject];
    }
    [self.allRecents addObject:todo];
}

@end
