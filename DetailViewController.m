//
//  DetailViewController.m
//  Nudget
//
//  Created by Landon Sandy on 2/2/13.
//  Copyright (c) 2013 Landon Sandy. All rights reserved.
//

#import "DetailViewController.h"
#import "Goal.h"
#import "MasterViewController.h"
@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController
@synthesize row;
@synthesize masterPopoverController;
#pragma mark - Managing the detail item

-(void)setRow:(int)thisrow{
        [self configureView];
    row=thisrow;
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    UINavigationController *mainnav; //= [self.splitViewController.viewControllers objectAtIndex:0];
    MasterViewController *mvc;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        mainnav = [self.splitViewController.viewControllers objectAtIndex:0];
    }
    else{
        mainnav =(UINavigationController *)self.parentViewController;
    }
    mvc = [mainnav.viewControllers objectAtIndex:0];
    if (mvc._goals.count>0) {
        Goal *g=mvc._goals[row];

        self.detailDescriptionLabel.text =[NSString stringWithFormat:@"%@ %d %@", g.verb , g.goal, g.object];
       
    }
}
-(IBAction)change:(id)sender{
    UINavigationController *mainnav; //= [self.splitViewController.viewControllers objectAtIndex:0];
    MasterViewController *mvc;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        mainnav = [self.splitViewController.viewControllers objectAtIndex:0];
    }
    else{
        mainnav =(UINavigationController *)self.parentViewController;
    }
    mvc = [mainnav.viewControllers objectAtIndex:0];
    Goal *g=mvc._goals[row];
    
    g.goal=100;
    [mvc saveGoals];
    [mvc.tableView reloadData];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
    [splitController reloadInputViews];

}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    //self.masterPopoverController = nil;
    [splitController reloadInputViews];

}

@end
