//
//  ViewController.h
//  Bill-Splitter
//
//  Created by Cameron Mcleod on 2019-06-08.
//  Copyright © 2019 Cameron Mcleod. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *totalBillText;
@property (weak, nonatomic) IBOutlet UISlider *splitSlider;
@property (weak, nonatomic) IBOutlet UILabel *splitBillText;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;

- (IBAction)sliderValueChanged:(UISlider *)sender;

@end

NS_ASSUME_NONNULL_END
