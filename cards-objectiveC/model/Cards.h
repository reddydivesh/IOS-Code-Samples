//
//  Cards.h
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cards : NSObject

@property (strong,nonatomic) NSString *contents;

@property(nonatomic) BOOL chosen;
@property(nonatomic) BOOL matched;

-(int)match:(NSArray *)otherCard;

@end
