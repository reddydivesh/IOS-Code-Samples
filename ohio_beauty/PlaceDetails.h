//
//  PlaceDetails.h
//  ohio_beauty
//
//  Created by Jayanth Devulapally on 12/3/14.
//  Copyright (c) 2014 Jayanth. All rights reserved.
//this class describes the breif view of place

#import <Foundation/Foundation.h>

@interface PlaceDetails : NSObject

@property(strong,nonatomic) NSString* placeName;
@property(strong,nonatomic) NSString* placeDescription;
@property(strong,nonatomic) NSString* placeImages;
@property(strong,nonatomic) NSString* placeImgURL;

@end
