//
//  MLCPlayingCardGameViewController.m
//  Matchismo
//
//  Created by Martin Calvert on 1/15/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import "MLCPlayingCardGameViewController.h"
#import "PlayingCardDesk.h"

@interface MLCPlayingCardGameViewController ()

@end

@implementation MLCPlayingCardGameViewController

- (Deck *)createDeck{
    return [[PlayingCardDesk alloc]init];
}

@end
