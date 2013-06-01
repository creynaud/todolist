//
//  BBAboutViewController.m
//  TodoList
//
//  Created by Claire Reynaud on 6/1/13.
//  Copyright (c) 2013 BabelBytes. All rights reserved.
//

#import "BBAboutViewController.h"

@interface BBAboutViewController ()

@end

@implementation BBAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedStringFromTable(@"About", @"Application", nil);
    
    self.textView.text = NSLocalizedStringFromTable(@"AboutText", @"Application", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
