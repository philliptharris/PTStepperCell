//
//  PTStepperCell.h
//  PTStepperCellExample
//
//  Created by Phillip Harris on 4/28/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PTStepperCellDelegate;

extern NSString * const PTStepperCellReuseIdentifier;

@interface PTStepperCell : UITableViewCell

@property (nonatomic, weak) id <PTStepperCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIStepper *stepper;

/// Optional. Use this if you want the cell to bind the value of the stepper to a key in NSUserDefaults.
@property (nonatomic, strong) NSString *userDefaultsIntegerKey;

- (IBAction)stepperValueDidChange:(id)sender;

@end


@protocol PTStepperCellDelegate <NSObject>

@optional

- (void)stepperCellValueDidChange:(PTStepperCell *)cell;

@end
