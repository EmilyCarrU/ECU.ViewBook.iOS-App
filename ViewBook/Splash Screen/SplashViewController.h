//
//  ViewController.h
//  ViewBook
//
//  Created by Jesse Scott on 2013-07-13.
//  Copyright (c) 2013 Emily Carr Institute of Art + Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/NSTimer.h>

@interface SplashViewController : UIViewController {
  
    // Timer To Control Animation To Next Screen
    NSTimer *timer;
    
}

@property (nonatomic, retain) NSTimer *timer;



@end
