//
//  MainViewController.m
//  YueTwo
//
//  Created by mo jun on 10/21/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import "MainViewController.h"
#import "CustomCalloutView.h"
#import "CustomAnnotationView.h"
#import "NavbarViewController.h"
#import "BottomBarViewController.h"
#import "FieldBlockView.h"

@interface MainViewController ()<MAMapViewDelegate, UITextFieldDelegate>{
    IBOutlet UIView *_navbarContainer;
    IBOutlet UIView *_centerContainer;
    IBOutlet UIView *_bottombarContainer;
    
    NavbarViewController    *_navbarController;
    BottomBarViewController *_bottomBarController;
    MAMapView *_mapView;
    
    UIView *_centerMaskView;
    
    MAPointAnnotation *_pointAnnotation;
    
    FieldBlockView *_searchBlockView;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _navbarController = [NavbarViewController vcFromXib];
    [self addChildViewController:_navbarController toContainer:_navbarContainer];
    
    _mapView = [[MAMapView alloc]initWithFrame:CGRectZero];
    _mapView.delegate = self;
    [_centerContainer addSubview:_mapView];
    _mapView.showsUserLocation = NO;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_centerContainer);
    }];
    
    _bottomBarController = [BottomBarViewController vcFromXib];
    [self addChildViewController:_bottomBarController toContainer:_bottombarContainer];
    
    _searchBlockView = [[FieldBlockView alloc]init];
    _searchBlockView.field.delegate = self;
    _searchBlockView.field.returnKeyType = UIReturnKeySearch;
    [self.view addSubview:_searchBlockView];
    [_searchBlockView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(74);
        make.height.mas_equalTo(40);
    }];
    
    _centerMaskView = [UIView new];
    _centerMaskView.backgroundColor = [UIColor blackColor];
    _centerMaskView.alpha = 0.5f;
    _centerMaskView.hidden = YES;
    [_centerContainer addSubview:_centerMaskView];
    [_centerMaskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_centerContainer);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapResignKeyboard:)];
    [_centerMaskView addGestureRecognizer:tap];
}

- (void)tapResignKeyboard:(UITapGestureRecognizer *)gesture{
    [self.view endEditing:YES];
    _centerMaskView.hidden = YES;
}

-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
//        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}

- (void)mapView:(MAMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    CLLocationCoordinate2D coord = mapView.centerCoordinate;
    NSLog(@"latitude : %f,longitude: %f", coord.latitude, coord.longitude);
    
}

- (void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    if (_pointAnnotation) {
        [mapView removeAnnotation:_pointAnnotation];
    }
    
    CLLocationCoordinate2D coord = mapView.centerCoordinate;
    NSLog(@"c latitude : %f,longitude: %f", coord.latitude, coord.longitude);
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc]init];
    pointAnnotation.title = @"呼叫附近的人";
    pointAnnotation.coordinate = coord;
    [mapView addAnnotation:pointAnnotation];
    _pointAnnotation = pointAnnotation;
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = NO;        //设置标注动画显示，默认为NO
//        annotationView.draggable = NO;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
//        return annotationView;
        
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        CustomAnnotationView *annotationView = (CustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[CustomAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];
        }
//        annotationView.image = [UIImage imageNamed:@"restaurant"];
        annotationView.pinColor = MAPinAnnotationColorPurple;
        annotationView.animatesDrop = NO;        //设置标注动画显示，默认为NO
        annotationView.draggable = NO;
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
        
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
//        annotationView.centerOffset = CGPointMake(0, -18);
        [annotationView setSelected:YES animated:YES];
        return annotationView;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _centerMaskView.hidden = NO;
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
