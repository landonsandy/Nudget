//
//  MasterViewController.h
//  Nudget
//
//  Created by Landon Sandy on 2/2/13.
//  Copyright (c) 2013 Landon Sandy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goal.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic)     NSMutableArray *_goals;
-(NSMutableArray *)unarchiveGoals;
-(void)saveGoals;
@end
