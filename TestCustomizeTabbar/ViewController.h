//
//  ViewController.h
//  TestCustomizeTabbar
//
//  Created by GIGIGUN on 1/2/16.
//  Copyright © 2016 GIGIGUN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, strong) UIViewController *currentViewController;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *tabBarButtons;
@property (nonatomic, weak) IBOutlet UIView *placeholderView;
- (void) setSelectedIndex: (int) index;
@end

