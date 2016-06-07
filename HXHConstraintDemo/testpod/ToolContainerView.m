//
//  ToolContainerView.m
//  testpod
//
//  Created by 张强 on 16/6/3.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ToolContainerView.h"

@interface ToolContainerView ()

@property (nonatomic, strong) UIImageView * topImage;

@property (nonatomic, strong) UILabel * bottomLabel;

@end

@implementation ToolContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    [self configUI];
}

- (void)configUI {
    
    _topImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageName]];
    _topImage.backgroundColor = [UIColor blackColor];
    [self addSubview:_topImage];
    [self.topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(10);
    }];
    
    _bottomLabel = [[UILabel alloc] init];
    _bottomLabel.text = self.title;
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    _bottomLabel.font = [UIFont systemFontOfSize:14.0f];
    _bottomLabel.textColor = [UIColor whiteColor];
    _bottomLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:_bottomLabel];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self).with.offset(0);
        make.height.mas_equalTo(20);
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
    }];

}


@end
