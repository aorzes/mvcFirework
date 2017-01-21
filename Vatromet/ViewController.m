//
//  ViewController.m
//  Vatromet
//
//  Created by Anton Orzes on 21/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "ViewController.h"
#import "Raketa.h"
#import "Eksplozija.h"

@interface ViewController ()
{
    Raketa *r;
    int numExplosion;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    numExplosion = 144;
    Raketa *r1 = [[Raketa alloc]initWithPosition:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height) angle:-M_PI_2];
    [self.view addSubview:r1];
    // add observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(myDetect:) name:@"myMessage" object:nil];
   
}
-(void)myDetect:(NSNotification *)notification {
    numExplosion--;
    if (numExplosion<1) {
        [[NSNotificationCenter defaultCenter]removeObserver:self];
    }
    double posX = [[notification.userInfo objectForKey:@"posX"] doubleValue];
    double posY = [[notification.userInfo objectForKey:@"posY"] doubleValue];
    [Eksplozija initWithView:self position:CGPointMake(posX, posY)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
