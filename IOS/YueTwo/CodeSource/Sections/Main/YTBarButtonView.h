//
//  YTBarButtonView.h
//  YueTwo
//
//  Created by mo jun on 10/22/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTBadgeLabel.h"

@interface YTBarButtonView : UIView

@property (nonatomic, strong, readonly) UIButton *button;

- (void)setBadgeText:(NSString *)text;

@end
