//
//  ViewController.m
//  TestCustomizeTabbar
//
//  Created by GIGIGUN on 1/2/16.
//  Copyright © 2016 GIGIGUN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([_tabBarButtons count]) {
        
        [self performSegueWithIdentifier: @"View1"
                                  sender: _tabBarButtons[0]];
        
    }

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setSelectedIndex: (int) index
{
    if ([_tabBarButtons count] <= index) return;
    
    NSArray *availableIdentifiers = @[@"View1",
                                      @"View2"];
    [self performSegueWithIdentifier: availableIdentifiers[index]
                              sender: _tabBarButtons[index]];
}

- (BOOL) shouldAutorotate
{
    return YES;
}

-(void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
    
    NSArray *availableIdentifiers = @[@"View1",
                                      @"View2"];
    
    if([availableIdentifiers containsObject: segue.identifier])
    {
        for (UIButton *btn in _tabBarButtons)
        {
            if(sender != nil && ![btn isEqual: sender]) {
                [btn setSelected: NO];
            } else if(sender != nil) {
                [btn setSelected: YES];
            }
        }
    }
}

@end
