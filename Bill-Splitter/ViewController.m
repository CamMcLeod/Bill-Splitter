//
//  ViewController.m
//  Bill-Splitter
//
//  Created by Cameron Mcleod on 2019-06-08.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self totalBillText] setDelegate: self];
    self.totalBillText.clearsOnBeginEditing = YES;
    self.totalBillText.keyboardType = UIKeyboardTypeDecimalPad;
    self.splitSlider.value = roundf(4.0);
    self.splitBillText.text = [NSString stringWithFormat: @"$50.00 split 4 ways"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sliderValueChanged:(UISlider *)sender {
    
    [self.totalBillText resignFirstResponder];
    sender.value = roundf(sender.value);
    float billTotal = [self.totalBillText.text floatValue];
    float splitByNumber = sender.value;
    float splitBill = billTotal/splitByNumber;
    
    self.splitBillText.text = [NSString stringWithFormat: @"$%.2f split %.f ways", splitBill, sender.value];
    
}

-           (BOOL)textField:(UITextField *)textField
   shouldChangeCharactersInRange:(NSRange)range
           replacementString:(NSString *)text
{
    
    if( (char)text == 8){
        return YES;
    }
    
    NSCharacterSet *numbersOnlySet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    
    NSCharacterSet *intextFieldSet = [NSCharacterSet characterSetWithCharactersInString:text];
    
    BOOL stringIsValid = [numbersOnlySet isSupersetOfSet:intextFieldSet];
    
    NSRange range2 = [textField.text rangeOfString: @"." options:0];
    
    if(range2.location != NSNotFound)
    {
        NSUInteger trailingDigits = [textField.text length] - range2.location;
        NSLog(@"%lu", trailingDigits);
        if ([text isEqualToString:@"."]) {
            stringIsValid = NO;
        } else if (trailingDigits > 2) {
            stringIsValid = NO;
        }
        
    }
    
    return stringIsValid;
}

@end
