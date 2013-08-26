//
//  ViewController.h
//  scroll testing
//
//  Created by Pandita on 2013-08-22.
//  Copyright (c) 2013 Comp3912. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *description;

@end
