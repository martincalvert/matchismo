//
//  PlayingCard.m
//  Matchismo
//
//  Created by Martin Calvert on 1/9/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards{
    int score = 0;
    NSMutableArray *otherSet = [otherCards mutableCopy];
    for (PlayingCard *card in otherCards) {
        if ([self.suit isEqualToString:card.suit]) score +=1;
        if (self.rank == card.rank) score += 4;
        if (otherCards.count > 1) {
            for (PlayingCard *cards in otherSet) {
                if (card != cards) {
                    if ([cards.suit isEqualToString:card.suit]) score +=1;
                    if (cards.rank == card.rank) score += 4;
                    [otherSet removeObject:cards];
                }
            }
        }
        
    }
    return score;
}

@synthesize suit = _suit;

#pragma mark - Instance Methods

-(NSString *)contents{
    
    return [[[PlayingCard rankStrings] objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString*)suit{
    return _suit ? _suit : @"?";
}

#pragma mark - Class Methods

+ (NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count] -1;
}

@end
