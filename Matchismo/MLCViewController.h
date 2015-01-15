//
//  MLCViewController.h
//  Matchismo
//
//  Created by Martin Calvert on 1/8/15.
//  Copyright (c) 2015 Martin Calvert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface MLCViewController : UIViewController


//For subclassers
- (Deck *)createDeck; //abstract

@end
