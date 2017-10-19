//
//  Deck.m
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property(strong,nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(NSMutableArray*)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Cards *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }
    else{
        [self.cards addObject:card];
    }
}
-(void)addCard:(Cards *)card{
    [self addCard:card atTop:NO];
}

-(Cards *)drawRandomCard{
    Cards *randomCard = nil;
    if ([self.cards count]){
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
