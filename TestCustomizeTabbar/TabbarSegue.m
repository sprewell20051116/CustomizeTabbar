//
//  TabbarSegue.m
//  TestCustomizeTabbar
//
//  Created by GIGIGUN on 1/2/16.
//  Copyright © 2016 GIGIGUN. All rights reserved.
//

#import "TabbarSegue.h"
#import "ViewController.h"
@implementation TabbarSegue

- (void) perform
{
    ViewController *tabBarController = (ViewController *) self.sourceViewController;
    UIViewController *destinationController = (UIViewController *) self.destinationViewController;
    
    for (UIView *view in tabBarController.placeholderView.subviews)
    {
        [view removeFromSuperview];
    }
    
    // Add view to placeholder view
    tabBarController.currentViewController = destinationController;
    [tabBarController.placeholderView addSubview: destinationController.view];
    
    // Set autoresizing
    [tabBarController.placeholderView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *childview = destinationController.view;
    [childview setTranslatesAutoresizingMaskIntoConstraints: NO];
    
    // fill horizontal
    [tabBarController.placeholderView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[childview]|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(childview)]];
    
    // fill vertical
    [tabBarController.placeholderView addConstraints:[ NSLayoutConstraint constraintsWithVisualFormat: @"V:|-0-[childview]-0-|" options: 0 metrics: nil views: NSDictionaryOfVariableBindings(childview)]];
    
    [tabBarController.placeholderView layoutIfNeeded];
    
    // notify did move
    [destinationController didMoveToParentViewController: tabBarController];
}

@end
