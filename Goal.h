//
//  Goal.h
//  Nudget
//
//  Created by Landon Sandy on 2/2/13.
//  Copyright (c) 2013 Landon Sandy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject{
}

@property (assign, nonatomic) BOOL toIncrease;
@property (assign, nonatomic) NSInteger goal;
@property (strong, nonatomic) NSString *verb;
@property (strong, nonatomic) NSString *object;
@property (strong, nonatomic) NSDate *creationDate;
@end
