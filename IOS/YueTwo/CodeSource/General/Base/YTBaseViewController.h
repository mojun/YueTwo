//
//  YTBaseViewController.h
//  YueTwo
//
//  Created by mo jun on 10/21/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Base)

- (instancetype)initWithXib;

+ (instancetype)vcFromXib;

- (void)addChildViewController:(UIViewController *)controller toContainer:(UIView *)container;

@end

@interface YTBaseViewController : UIViewController

@end
