//
//  UseVflViewController.m
//  testpod
//
//  Created by 张强 on 16/6/3.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "UseVflViewController.h"
#import "ToolContainerView.h"

@interface UseVflViewController ()

@property (nonatomic, weak) IBOutlet UIImageView * topImageView;
@property (nonatomic, weak) IBOutlet UIView * bottomContainerView;

@property (nonatomic, weak) IBOutlet ToolContainerView * rotateContainerView;
@property (nonatomic, weak) IBOutlet ToolContainerView * mosaicContainerView;
@property (nonatomic, weak) IBOutlet ToolContainerView * clipingContainerView;

@end

@implementation UseVflViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 清空约束
    [[self.view constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view removeConstraint:obj];
    }];
    
    [[self.bottomContainerView constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.bottomContainerView removeConstraint:obj];
    }];
    
    // 设置手写约束属性
    self.topImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.bottomContainerView.translatesAutoresizingMaskIntoConstraints = false;
    self.rotateContainerView.translatesAutoresizingMaskIntoConstraints = false;
    self.mosaicContainerView.translatesAutoresizingMaskIntoConstraints = false;
    self.clipingContainerView.translatesAutoresizingMaskIntoConstraints = false;
    
    NSDictionary * viewsDict = @{@"topImageView":          self.topImageView,
                                 @"bottomContainerView":   self.bottomContainerView,
                                 @"rotateContainerView":   self.rotateContainerView,
                                 @"mosaicContainerView":   self.mosaicContainerView,
                                 @"clipingContainerView":  self.clipingContainerView};
    
    // Image Constraints
    NSArray * top_H = [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-0-[topImageView]-0-|" options:0 metrics:nil views: viewsDict];
    
    NSLayoutConstraint *top_V = [NSLayoutConstraint constraintWithItem:self.topImageView
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.view
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:1
                                                                constant:0];
    [self.view addConstraint:top_V];
    [self.view addConstraints:top_H];
    
    // bottomContainerView Constraints
    NSArray * bottonContainer_H = [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-0-[bottomContainerView]-0-|" options:0 metrics:nil views: viewsDict];
    NSArray * bottonContainer_V = [NSLayoutConstraint constraintsWithVisualFormat: @"V:[bottomContainerView(80)]-0-|" options:0 metrics:nil views: viewsDict];

    [self.view addConstraints:bottonContainer_H];
    [self.view addConstraints:bottonContainer_V];
    
    
    
    // rotateContainerView Constraints
    NSArray * rotateContainer_H = [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-55-[rotateContainerView(70)]" options:0 metrics:nil views: viewsDict];
    NSArray * rotateContainer_V = [NSLayoutConstraint constraintsWithVisualFormat: @"V:[rotateContainerView(70)]" options:0 metrics:nil views: viewsDict];
    
    NSLayoutConstraint *rotateCenter_Y = [NSLayoutConstraint constraintWithItem:self.rotateContainerView
                                                             attribute:NSLayoutAttributeCenterY
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomContainerView
                                                             attribute:NSLayoutAttributeCenterY
                                                            multiplier:1
                                                              constant:0];
    
    [self.view addConstraints:rotateContainer_H];
    [self.view addConstraints:rotateContainer_V];
    [self.view addConstraint:rotateCenter_Y];

    // mosaicContainerView Constraints
    NSArray * mosaicContainer_H = [NSLayoutConstraint constraintsWithVisualFormat: @"H:[mosaicContainerView(70)]" options:0 metrics:nil views: viewsDict];
    NSArray * mosaicContainer_V = [NSLayoutConstraint constraintsWithVisualFormat: @"V:[mosaicContainerView(70)]" options:0 metrics:nil views: viewsDict];
    NSLayoutConstraint *mosaicCenter_Y = [NSLayoutConstraint constraintWithItem:self.mosaicContainerView
                                                                      attribute:NSLayoutAttributeCenterY
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.bottomContainerView
                                                                      attribute:NSLayoutAttributeCenterY
                                                                     multiplier:1
                                                                       constant:0];
    NSLayoutConstraint *mosaicCenter_X = [NSLayoutConstraint constraintWithItem:self.mosaicContainerView
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:self.bottomContainerView
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1
                                                                       constant:0];
    [self.view addConstraints:mosaicContainer_H];
    [self.view addConstraints:mosaicContainer_V];
    [self.view addConstraint:mosaicCenter_Y];
    [self.view addConstraint:mosaicCenter_X];

    // clipingContainerView Constraints
    NSArray * clipingContainer_H = [NSLayoutConstraint constraintsWithVisualFormat: @"H:[clipingContainerView(70)]-55-|" options:0 metrics:nil views: viewsDict];
    NSArray * clipingContainer_V = [NSLayoutConstraint constraintsWithVisualFormat: @"V:[clipingContainerView(70)]" options:0 metrics:nil views: viewsDict];
    NSLayoutConstraint * clipingCenter_Y = [NSLayoutConstraint constraintWithItem:self.clipingContainerView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.bottomContainerView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1
                                                                         constant:0];
    [self.view addConstraints:clipingContainer_H];
    [self.view addConstraints:clipingContainer_V];
    [self.view addConstraint:clipingCenter_Y];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
