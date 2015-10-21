//
//  YTBaseViewController.m
//  YueTwo
//
//  Created by mo jun on 10/21/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import "YTBaseViewController.h"
#import "MOFileUtils.h"

@implementation UIViewController (Base)

- (instancetype)initWithXib{
    NSString *className = NSStringFromClass([self class]);
    
    NSString *nibName = nil;
    if ([MOFileUtils isExistsFileInRescource:[NSString stringWithFormat:@"%@.nib", className]]) {
        nibName = className;
    }
    
    if (self = [self initWithNibName:nibName bundle:nil]) {
        
    }
    
    return self;
}

+ (instancetype)vcFromXib{
    return [[self alloc]initWithXib];
}

@end

@interface YTBaseViewController ()

@end

@implementation YTBaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self onInitialize];
    }
    return self;
}

- (void)onInitialize{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)addChildViewController:(UIViewController *)controller toContainer:(UIView *)container{
    [self addChildViewController:controller];
    [container addSubview:controller.view];
    [controller.view mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(container);
    }];
    
    //    controller.view.frame = container.frame;
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
