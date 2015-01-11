//
//  MLCViewController.m
//  Matchismo
//
//  Created by Martin Calvert on 1/8/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "MLCViewController.h"

@interface MLCViewController ()

@end

@implementation MLCViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    }
}


@end
