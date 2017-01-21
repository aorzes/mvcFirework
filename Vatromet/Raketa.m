//
//  Raketa.m
//  Vatromet
//
//  Created by Anton Orzes on 21/01/2017.
//  Copyright © 2017 Anton Orzes. All rights reserved.
//

#import "Raketa.h"

@interface Raketa()
{
    CGPoint startPosition;
    CGPoint d;
    float maxDistance;
    NSTimer *t;
}
@end

@implementation Raketa

- (id)initWithPosition:(CGPoint)position angle:(float)k {
    self = [super init];
    if (self) {
        startPosition = position;
        const float velocity = 5.0;
        maxDistance = 150;
        self.frame = CGRectMake(position.x, position.y, 5, 5);
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        d.x = cos(k) * velocity;
        d.y = sin(k) * velocity;
        t = [NSTimer scheduledTimerWithTimeInterval:0.04
                                        target:self
                                        selector:@selector(moveRocket)
                                        userInfo:nil
                                        repeats:YES];
    }
    return self;
}

- (void)moveRocket {
    CGPoint position = self.center;
    position.x += d.x;
    position.y += d.y;
    self.center = position;
    float distance = hypotf(position.x-startPosition.x,position.y-startPosition.y);
    NSMutableDictionary *pos = [[NSMutableDictionary alloc]init];
    [pos setObject:[NSNumber numberWithDouble:position.x] forKey:@"posX"];
    [pos setObject:[NSNumber numberWithDouble:position.y] forKey:@"posY"];
    if(distance>maxDistance) {
        NSNotification *notification = [NSNotification notificationWithName:@"myMessage" object:self userInfo:pos];
        [[NSNotificationCenter defaultCenter]postNotification:notification];
        [t invalidate];
        t = nil;
        [self removeFromSuperview];
    }
    
}

@end
