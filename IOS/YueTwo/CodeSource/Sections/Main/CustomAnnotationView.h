//
//  CustomAnnotationView.h
//  YueTwo
//
//  Created by mo jun on 10/21/15.
//  Copyright © 2015 kimoworks. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CustomCalloutView.h"

@interface CustomAnnotationView : MAPinAnnotationView

@property (nonatomic, readonly) CustomCalloutView *calloutView;

@end
