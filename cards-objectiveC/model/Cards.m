//
//  Cards.m
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import "Cards.h"

@implementation Cards

-(int)match:(NSArray *)otherCard{
    int score = 0;
    for (Cards *cards in otherCard ) {
        if ([cards.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
