//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Martin Calvert on 1/12/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

#pragma mark - Properties

@property (nonatomic, readwrite) NSUInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

#pragma mark - Constants

static const int PENALTY = 1;
static const int BONUS = 2;

#pragma mark - Instance Methds

- (NSMutableArray*)cards{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count UsingDeck:(Deck *)deck{
    if (count <= 1) {
        return nil;
    }
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i++){
            Card *card = deck.drawRandomCard;
            if (card){
                [self.cards addObject:card];
            }
            else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        if (card.isChosen) {
            card.chosen = NO;
        }
        else{
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }
                    else{
                        self.score -= PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= PENALTY;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}


@end
