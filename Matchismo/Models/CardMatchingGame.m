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
@property (nonatomic, strong) NSString *resultString;

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
        self.matchAmount = 3;
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
    self.resultString = [NSString stringWithFormat:@"%@",card.contents];
    
    if (!card.isMatched){
        if (card.isChosen) {
            card.chosen = NO;
            self.resultString = @"";
        }
        else{
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            if (otherCards.count == self.matchAmount - 1){
                    int matchScore = [card match:otherCards];
                    if (matchScore) {
                        self.score += matchScore * BONUS;
                        card.matched = YES;
                        NSString *otherCardResults = @"";
                        for (Card *otherCard in otherCards) {
                            otherCard.matched = YES;
                            otherCardResults = [otherCardResults stringByAppendingString:otherCard.contents];
                        }
                        self.resultString = [self.resultString stringByAppendingString:[NSString    stringWithFormat:@"matched %@",otherCardResults]];
                    }
                    else{
                        self.score -= PENALTY;
                        self.resultString = [NSString stringWithFormat:@"No Match"];
                        for (Card *otherCard in otherCards) {
                            otherCard.chosen = NO;
                        }
                    }
            }
        }
        self.score -= PENALTY;
        card.chosen = YES;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}


@end
