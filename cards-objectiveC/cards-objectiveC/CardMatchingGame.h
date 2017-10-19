//
//  CardMatchingGame.h
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck* ) deck;



@property (nonatomic,readonly) NSInteger score;

@end
