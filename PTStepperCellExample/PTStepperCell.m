//
//  PTStepperCell.m
//  PTStepperCellExample
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "PTStepperCell.h"

NSString * const PTStepperCellReuseIdentifier = @"PTStepperCellReuseIdentifier";

@implementation PTStepperCell

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectZero];
        [stepper sizeToFit];
        [stepper addTarget:self action:@selector(stepperValueDidChange:) forControlEvents:UIControlEventValueChanged];
        stepper.minimumValue = 0.0;
        stepper.maximumValue = 100.0;
        stepper.wraps = YES;
        stepper.value = 50.0;
        self.accessoryView = stepper;
        self.stepper = stepper;
    }
    return self;
}

//===============================================
#pragma mark -
#pragma mark Setters
//===============================================

- (void)setUserDefaultsIntegerKey:(NSString *)userDefaultsIntegerKey {
    
    _userDefaultsIntegerKey = userDefaultsIntegerKey;
    
    self.stepper.value = (double)[[NSUserDefaults standardUserDefaults] integerForKey:userDefaultsIntegerKey];
}

//===============================================
#pragma mark -
#pragma mark Switch State
//===============================================

- (IBAction)stepperValueDidChange:(id)sender {
    
    NSLog(@"PTStepperCell | stepperValueDidChange");
    
    if ([self.delegate respondsToSelector:@selector(stepperCellValueDidChange:)]) {
        [self.delegate stepperCellValueDidChange:self];
    }
    
    if (self.userDefaultsIntegerKey) {
        [[NSUserDefaults standardUserDefaults] setInteger:(NSInteger)self.stepper.value forKey:self.userDefaultsIntegerKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
