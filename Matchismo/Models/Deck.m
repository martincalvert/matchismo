//
//  Deck.m
//  Matchismo
//
//  Created by Martin Calvert on 1/9/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "Deck.h"

@interface Deck()

#pragma mark - Properties

@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation Deck

#pragma mark - Instance Methods

-(NSMutableArray *)cards{
    if(_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void) addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}

-(void) addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = [self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}


@end
