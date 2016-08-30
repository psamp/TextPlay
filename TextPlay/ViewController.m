//
//  ViewController.m
//  TextPlay
//
//  Created by Princess Sampson on 8/29/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UILabel *leftLabel;
@property (nonatomic, strong) IBOutlet UILabel *rightLabel;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;
@property (nonatomic, copy) NSString *userText;

-(IBAction)updateLabel:(UIButton*)sender;
-(IBAction)clearLabels;
-(void)disableLeftRightButtons;

@end

@implementation ViewController

-(void)updateLabel:(UIButton *)sender {
    if (sender == self.leftButton) {
        self.leftLabel.text = self.userText;
    } else if(sender == self.rightButton) {
        self.rightLabel.text = self.userText;
    }
}

-(IBAction)clearLabels {
    self.leftLabel.text = @"";
    self.rightLabel.text = @"";
    [self disableLeftRightButtons];
}

-(void)disableLeftRightButtons {
    self.leftButton.enabled = NO;
    self.rightButton.enabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self disableLeftRightButtons];
    
    self.userText = [NSString string];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)textFieldDidEndEditing:(UITextField *)textField
                       reason:(UITextFieldDidEndEditingReason)reason {
    
    self.userText = textField.text;
    self.leftButton.enabled = YES;
    self.rightButton.enabled = YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    BOOL shouldReturn = NO;
    
    if(textField.text.length != 0) {
        [textField resignFirstResponder];
        shouldReturn = YES;
    }
    
    return shouldReturn;
}

@end
