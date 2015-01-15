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
#import "CardMatchingGame.h"

@interface MLCViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UILabel *lastMoveLabel;

@end

@implementation MLCViewController

- (CardMatchingGame *)game{
    if (!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] UsingDeck:[self createDeck]];
    return _game;
}

- (Deck *)createDeck{
    return [[PlayingCardDesk alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int index = [self.cardButtons indexOfObject:sender];
    self.game.matchAmount = self.gameTypeButton.selectedSegmentIndex+2;
    [self.game chooseCardAtIndex:index];
    self.gameTypeButton.enabled = false;
    [self updateUI];
}

- (IBAction)dealButton:(UIButton *)sender{
    self.gameTypeButton.enabled = true;
    self.game = nil;
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *button in self.cardButtons) {
        int index = [self.cardButtons indexOfObject:button];
        Card *card = [self.game cardAtIndex:index];
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
        self.lastMoveLabel.text = [NSString stringWithFormat:@"Last Move: %@",self.game.resultString];
    }
}

- (NSString *)titleForCard:(Card *)card{
    return (card.isChosen) ? [card contents] : @"";
}

- (UIImage *)imageForCard:(Card *)card{
    return [UIImage imageNamed:(card.isChosen) ? @"cardfront" : @"cardback"];
}


@end
