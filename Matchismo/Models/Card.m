//
//  Card.m
//  Matchismo
//
//  Created by Martin Calvert on 1/9/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

#pragma mark - Instance Methods

-(int)match:(NSArray *)otherCards{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    
    return score;
}

@end
