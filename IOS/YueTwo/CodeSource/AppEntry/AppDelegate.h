//
//  AppDelegate.h
//  YueTwo
//
//  Created by mo jun on 10/20/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, assign) CGFloat wRatio;

@property (nonatomic, assign) CGFloat hRatio;

@end

extern AppDelegate *app;

