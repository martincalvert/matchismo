//
//  MLCViewController.m
//  Matchismo
//
//  Created by Martin Calvert on 1/8/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "MLCViewController.h"
#import "PlayingCardDesk.h"
#import "PlayingCard.h"

@interface MLCViewController ()
@property (strong, nonatomic) Deck *deck;

@end

@implementation MLCViewController

- (Deck *)deck{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck{
    return [[PlayingCardDesk alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else{
        Card *card = [self.deck drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:[card contents] forState:UIControlStateNormal];
    }
}


@end
