//
//  ViewController.m
//  cards-objectiveC
//
//  Created by Jayanth Devulapally on 7/7/15.
//  Copyright (c) 2015 jayanth. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (strong,nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipCount;

@end

@implementation ViewController
@synthesize deck = _deck;
-(Deck *) deck{
    if (!_deck) {
    _deck = [[PlayingCardDeck alloc]init];
    }
    return _deck;
}
-(void)setDeck:(Deck *)deck{
    deck = _deck;
}
-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips:%d",_flipCount];
}
- (IBAction)flipCard:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        Cards *card = [self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
        }
    }
    self.flipCount++;
}


@end
