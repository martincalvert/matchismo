//
//  PlayingCardDesk.m
//  Matchismo
//
//  Created by Martin Calvert on 1/9/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "PlayingCardDesk.h"
#import "PlayingCard.h"

@implementation PlayingCardDesk

#pragma mark - Instance Methods

- (instancetype)init{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank=1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    
    
    return self;
}

@end
