//
//  Card.h
//  Matchismo
//
//  Created by Martin Calvert on 1/9/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

#pragma mark - Properties

@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

#pragma mark - Instance Methods

-(int)match:(NSArray *)otherCards;

@end
