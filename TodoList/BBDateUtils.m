//
//  BBDateUtils.m
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBDateUtils.h"

@implementation BBDateUtils


+ (NSDateFormatter *)localeDateFormatter
{
	static NSDateFormatter *dateFormatter;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
    });

    return dateFormatter;
}

+ (NSString *)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *localeDateFormatter = [BBDateUtils localeDateFormatter];
    localeDateFormatter.dateStyle = dateStyle;
    localeDateFormatter.timeStyle = timeStyle;
    return [localeDateFormatter stringFromDate:date];
}

+ (NSString *)shortLocalizedStringFromDate:(NSDate *)date {
    return [BBDateUtils localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}


@end
