//
//  ViewController.m
//  alex_app1
//
//  Created by akaon on 12. 8. 16..
//  Copyright (c) 2012년 jeonggwanlee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize toggleControls;
@synthesize doSomethingButton;
@synthesize sliderLabel;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize nameField;
@synthesize numberField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImageNormal forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [doSomethingButton setBackgroundImage:stretchableButtonImagePressed forState:UIControlStateHighlighted];

}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setNumberField:nil];
    [self setSliderLabel:nil];
    [self setLeftSwitch:nil];
    [self setRightSwitch:nil];
    [self setToggleControls:nil];
    [self setDoSomethingButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}
 
- (IBAction)textFildDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTab:(id)sender{
    [nameField resignFirstResponder];
    [numberField resignFirstResponder];
    
}
- (IBAction)sliderChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)roundf(slider.value);
    sliderLabel.text = [NSString stringWithFormat:@"%d", progressAsInt];
}
- (IBAction)switchChanged:(id)sender {
    UISwitch *whichSwitch = (UISwitch *)sender;
    BOOL setting = whichSwitch.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
    
}

- (IBAction)toggleControls:(id)sender {
    if ([sender selectedSegmentIndex] == 0){
        leftSwitch.hidden = NO;
        rightSwitch.hidden = NO;
        doSomethingButton.hidden = YES;
    }
    else {
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        doSomethingButton.hidden = NO;
    }
}

    
- (IBAction)buttonPressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"No Way!!" destructiveButtonTitle:@"Yes, I'm Sure!" otherButtonTitles:nil];
                          
    [actionSheet showInView:self.view];
}

                                  
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
    {
        if(buttonIndex != [actionSheet cancelButtonIndex])
        {
            NSString *msg = nil;
        
            if (nameField.text.length > 0)
                msg = [[NSString alloc] initWithFormat:@"You can breathe easy, %@, everything went OK.",nameField.text];
            else
                msg = @"You can breathe easy, everything went OK.";
                
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done" message:msg delegate:self cancelButtonTitle:@"됐어!"otherButtonTitles:@"잘했어",nil];
            
                [alert show];
        }
    }
        
@end
        
