//
//  PlayingCards.h
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import "Cards.h"

@interface PlayingCards : Cards

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
