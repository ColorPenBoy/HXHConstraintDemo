//
//  ViewController.m
//  testpod
//
//  Created by 张强 on 16/6/3.
//  Copyright © 2016年 ColorPen. All rights reserved.
//

#import "ViewController.h"

static NSString * const CellID = @"CellID";


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@property (nonatomic, strong) NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
    
    self.dataArray = [Model getModelArray];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Model * model = self.dataArray[indexPath.row];

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Model * model = self.dataArray[indexPath.row];

    Class currentClass = NSClassFromString(model.className);
    UIViewController *viewController = [[currentClass alloc] init];
    viewController.title = model.title;
    if (viewController) {
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

@implementation Model


+ (NSArray *)getModelArray {

    NSArray * dataArray = @[@{@"title":@"XIB",      @"className":@"UseXibViewController"},
                            @{@"title":@"Masonry",  @"className":@"UseMasonryViewController"},
                            @{@"title":@"VFL",      @"className":@"UseVflViewController"}];
    NSMutableArray * mArr = [NSMutableArray array];
    
    [dataArray enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        Model * model = [[Model alloc] init];
        [model setValue:obj[@"title"] forKey:@"title"];
        [model setValue:obj[@"className"] forKey:@"className"];
        
        [mArr addObject:model];
        
    }];
    
    return mArr;
}


@end
