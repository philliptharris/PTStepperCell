//
//  MyTableViewController.m
//  PTSwitchCell
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "MyTableViewController.h"

#import "PTStepperCell.h"

@interface MyTableViewController () <PTStepperCellDelegate>

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Option A: Register the class.
//    [self.tableView registerClass:[PTStepperCell class] forCellReuseIdentifier:PTStepperCellReuseIdentifier];
    
    // Option B: Register the Nib.
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([PTStepperCell class]) bundle:nil] forCellReuseIdentifier:PTStepperCellReuseIdentifier];
}

//===============================================
#pragma mark -
#pragma mark UITableViewDataSource
//===============================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PTStepperCell *cell = [tableView dequeueReusableCellWithIdentifier:PTStepperCellReuseIdentifier forIndexPath:indexPath];
    
    cell.delegate = self;
    
    NSString *userDefaultsIntegerKey = [NSString stringWithFormat:@"Feature %i", indexPath.row + 1];
    
    cell.userDefaultsIntegerKey = userDefaultsIntegerKey;
    
    NSInteger savedDefault = [[NSUserDefaults standardUserDefaults] integerForKey:userDefaultsIntegerKey];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %i", userDefaultsIntegerKey, savedDefault];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//===============================================
#pragma mark -
#pragma mark PTStepperCellDelegate
//===============================================

- (void)stepperCellValueDidChange:(PTStepperCell *)cell {
    
    NSLog(@"MyTableViewController | switchCellValueDidChange");
    
    [self.tableView reloadData];
}

@end
