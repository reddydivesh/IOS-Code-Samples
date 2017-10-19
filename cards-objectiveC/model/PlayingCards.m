//
//  PlayingCards.m
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import "PlayingCards.h"

@implementation PlayingCards

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCards rankString];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
+(NSArray *)validSuits{
    return @[@"♣︎",@"♠︎",@"♥︎",@"♦︎"];
}
+(NSArray *)rankString{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
@synthesize suit =_suit;
-(void)setSuit:(NSString *)suit{
    if ([[PlayingCards validSuits] containsObject:suit]) {
        _suit=suit;
    }
}
-(NSString*) suit{
    return _suit ? _suit :@"";
}
+(NSUInteger)maxRank{return [[self rankString] count]-1; }

-(void)setRank:(NSUInteger)rank{
    if (rank <=[PlayingCards maxRank]) {
        _rank=rank;
    }
}

@end
