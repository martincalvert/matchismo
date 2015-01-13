//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Martin Calvert on 1/12/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

#pragma mark - Instance Methods

- (instancetype)initWithCardCount:(NSUInteger)count UsingDeck:(Deck*)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

#pragma mark - Properties
@property (nonatomic, readonly) NSUInteger score;

@end
