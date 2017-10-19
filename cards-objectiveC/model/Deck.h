//
//  Deck.h
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cards.h"

@interface Deck : NSObject

-(void) addCard:(Cards *)card atTop:(BOOL)atTop;
-(void) addCard:(Cards *)card;
-(Cards *)drawRandomCard;

@end
