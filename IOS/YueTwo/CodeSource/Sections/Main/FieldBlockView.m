//
//  FieldBlockView.m
//  G4Customer
//
//  Created by mo jun on 5/10/15.
//  Copyright (c) 2015 guotion. All rights reserved.
//

#import "FieldBlockView.h"

@interface FieldBlockView ()

@end

@implementation FieldBlockView{
    CGFloat xPadding;
    
    CGFloat xFieldPadding;
}

- (id)init{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    CGFloat scale = [UIScreen mainScreen].scale;
    xPadding = 24 * scale;
    
    xFieldPadding = 10 * scale;
    
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backgroundview = [UIView new];
    backgroundview.alpha = 0.7;
    backgroundview.backgroundColor = [UIColor whiteColor];
    [self addSubview:backgroundview];
    [backgroundview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setTitle:@"A" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:searchButton];
    [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.width.mas_equalTo(40);
    }];
    self.searchButton = searchButton;
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor grayColor];
    lineView.alpha = 0.5;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchButton.mas_right).with.offset(2);
        make.top.mas_equalTo(6);
        make.bottom.mas_equalTo(-6);
        make.width.mas_equalTo(1);
    }];
    
    UITextField *field = [UITextField new];
    field.backgroundColor = [UIColor clearColor];
    field.textColor = [UIColor blackColor];
    field.tintColor = [UIColor blueColor];
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
//    field.rightViewMode = UITe
    [self addSubview:field];
    [field mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(searchButton.mas_right).with.offset(4);
        make.right.equalTo(@[@(-5)]);
    }];
    self.field = field;
    
    backgroundview.layer.cornerRadius = 4.0f;
    backgroundview.layer.shadowColor = [UIColor blackColor].CGColor;
    backgroundview.layer.shadowOffset = CGSizeZero;
    backgroundview.layer.shadowOpacity = 0.8f;
    backgroundview.layer.shadowRadius = 2;
}

- (void)awakeFromNib{
    
    [self initialize];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGFloat cornerRadius = 4.0f;
//    CGRect bounds = CGRectInset(self.bounds, xPadding, 1);
//    NSLog(@"%@", NSStringFromCGRect(bounds));
//    CGMutablePathRef pathRef = CGPathCreateMutable();
//    
//    CGPathAddRoundedRect(pathRef, &CGAffineTransformIdentity, bounds, cornerRadius, cornerRadius);
//    [[UIColor whiteColor]setStroke];
//    CGContextAddPath(ctx, pathRef);
//    CGContextSetLineWidth(ctx, 1);
//    CGContextDrawPath(ctx, kCGPathStroke);
//    CGPathRelease(pathRef);
//}


@end
