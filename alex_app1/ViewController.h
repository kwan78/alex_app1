//
//  ViewController.h
//  alex_app1
//
//  Created by akaon on 12. 8. 16..
//  Copyright (c) 2012년 jeonggwanlee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toggleControls;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

- (IBAction)textFildDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)toggleControls:(id)sender;
- (IBAction)buttonPressed:(id)sender;

@end
