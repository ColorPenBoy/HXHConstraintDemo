//
//  UseMasonryViewController.m
//  testpod
//
//  Created by 张强 on 16/6/3.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "UseMasonryViewController.h"
#import "ToolContainerView.h"

@interface UseMasonryViewController ()

@property (nonatomic, weak) IBOutlet UIImageView * topImageView;
@property (nonatomic, weak) IBOutlet UIView * bottomContainerView;

@property (nonatomic, weak) IBOutlet ToolContainerView * rotateContainerView;
@property (nonatomic, weak) IBOutlet ToolContainerView * mosaicContainerView;
@property (nonatomic, weak) IBOutlet ToolContainerView * clipingContainerView;

@end

@implementation UseMasonryViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    // 清空约束
    [[self.view constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.view removeConstraint:obj];
    }];
    
    [[self.bottomContainerView constraints] enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.bottomContainerView removeConstraint:obj];
    }];
    
    // Image Constraints
    [self.topImageView mas_updateConstraints:^(MASConstraintMaker *make) {

        make.center.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        
    }];
    
    // bottomContainerView Constraints
    [self.bottomContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(80);
    }];
    
    // rotateContainerView Constraints
    self.rotateContainerView.imageName = @"btn_1";
    self.rotateContainerView.title = @"旋转";
    [self.rotateContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomContainerView);
        make.left.equalTo(self.bottomContainerView).with.offset(55);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
    }];

    // mosaicContainerView Constraints
    self.mosaicContainerView.imageName = @"btn_2";
    self.mosaicContainerView.title = @"马赛克";
    [self.mosaicContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomContainerView);
        make.centerX.equalTo(self.bottomContainerView);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
    }];

    // clipingContainerView Constraints
    self.clipingContainerView.imageName = @"btn_3";
    self.clipingContainerView.title = @"剪裁";
    [self.clipingContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomContainerView);
        make.right.equalTo(self.bottomContainerView).with.offset(-55);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(70);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
