//
//  YTBadgeLabel.m
//  YueTwo
//
//  Created by mo jun on 10/22/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import "YTBadgeLabel.h"

@implementation YTBadgeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)awakeFromNib{
    [self setup];
}

- (void)setup{
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor blueColor];
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
    self.font = [UIFont systemFontOfSize:12];
    self.hidden = YES;
}

- (void)setText:(NSString *)text{
    if (text.length >= 3) {
        text = @"99";
        self.hidden = NO;
    } else if (text == nil || text.length == 0) {
        text = @"";
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
    [super setText:text];
}

- (void)setFrame:(CGRect)frame{
    frame.size.width = 20;
    frame.size.height = 20;
    [super setFrame:frame];
}

//- (void)layoutSubviews{
//    
//    CGPoint center = self.center;
//    NSDictionary *attributes = @{NSFontAttributeName: self.font};
//    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 16) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
//    CGFloat textWidth = roundf(textSize.width);
//    textWidth = (textWidth < 20) ? 20 : textWidth;
//    CGRect textFrame = self.frame;
//    textFrame.size.width = textWidth;
//    self.frame = textFrame;
//    self.center = center;
//    
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
