//
//  PlayingCardDeck.m
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCards.h"

@implementation PlayingCardDeck

-(instancetype) init
{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCards validSuits]) {
            for (NSUInteger rank = 1; rank<=[PlayingCards maxRank];rank++) {
                PlayingCards *card = [[PlayingCards alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
