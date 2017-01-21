//
//  Eksplozija.m
//  Vatromet
//
//  Created by Anton Orzes on 21/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Eksplozija.h"
#import "Raketa.h"



@implementation Eksplozija

+(void)initWithView:(UIViewController *)mainView position:(CGPoint)position {
    
    for (int i=0; i<12; i++) {
        float kut = M_PI/6 * (float)i;
        Raketa *r1 = [[Raketa alloc]initWithPosition:position angle:kut];
        [mainView.view addSubview:r1];
    }
    
}



@end
