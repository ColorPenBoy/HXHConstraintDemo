//
//  ViewController.h
//  testpod
//
//  Created by 张强 on 16/6/3.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@end

@interface Model : NSObject

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, copy, readonly) NSString * className;

+ (NSArray *)getModelArray;

@end