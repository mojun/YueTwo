//
//  YTBarButtonView.m
//  YueTwo
//
//  Created by mo jun on 10/22/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import "YTBarButtonView.h"

@implementation YTBarButtonView{
    YTBadgeLabel *_badgeLabel;
}

- (instancetype)init{
    if (self = [super init]) {
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.contentMode = UIViewContentModeCenter;
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _badgeLabel = [[YTBadgeLabel alloc]init];
        _badgeLabel.userInteractionEnabled = NO;
        [self addSubview:_badgeLabel];
        [_badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-8);
            make.width.mas_equalTo(16);
            make.height.mas_equalTo(16);
        }];
        
    }
    return self;
}

- (void)setBadgeText:(NSString *)text{
    _badgeLabel.text = text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
