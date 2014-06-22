//
//  Obstacle.m
//  FlappyBird
//
//  Created by Benjamin Encz on 10/02/14.
//  Copyright (c) 2014 MakeGamesWithUs inc. Free to use for all purposes.
//

#import "Obstacle.h"

@implementation Obstacle {
  CCNode *_topPipe;
  CCNode *_bottomPipe;
}

#define ARC4RANDOM_MAX      0x100000000

// visibility on a 3,5-inch iPhone ends a 88 points and we want some meat
static const CGFloat minimumYPosition = 200.f;
// visibility ends at 480 and we want some meat
static const CGFloat maximumYPosition = 380.f;

- (void)didLoadFromCCB {
  _topPipe.physicsBody.collisionType = @"level";
  _topPipe.physicsBody.sensor = YES;

  _bottomPipe.physicsBody.collisionType = @"level";
  _bottomPipe.physicsBody.sensor = YES;
}

- (void)setupRandomPosition {
  // value between 0.f and 1.f
  CGFloat random = ((double)arc4random() / ARC4RANDOM_MAX);
  CGFloat range = maximumYPosition - minimumYPosition;
  self.position = ccp(self.position.x, minimumYPosition + (random * range));
}

@end