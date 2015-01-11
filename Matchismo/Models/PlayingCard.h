//
//  PlayingCard.h
//  Matchismo
//
//  Created by Martin Calvert on 1/9/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

#pragma mark - Properties

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

#pragma mark - Class Methods

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
