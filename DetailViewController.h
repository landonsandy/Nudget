//
//  DetailViewController.h
//  Nudget
//
//  Created by Landon Sandy on 2/2/13.
//  Copyright (c) 2013 Landon Sandy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (assign, nonatomic) int row;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
-(IBAction)change:(id)sender;
@end
