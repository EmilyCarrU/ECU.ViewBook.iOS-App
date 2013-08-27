//
//  UnderGradraduateViewController.h
//  ViewBook
//
//  Created by Pandita on 2013-08-23.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnderGradraduateViewController : UIViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *courseNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *courseDescriptionLabel;

@end
