//
//  BBDateUtils.h
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBDateUtils : NSObject

+ (NSString *)localizedStringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;
+ (NSString *)shortLocalizedStringFromDate:(NSDate *)date;

@end
