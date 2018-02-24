//
//  ViewController.m
//  VierticalScrollView
//
//  Created by AaronLee on 2018/2/24.
//  Copyright © 2018年 AaronLee. All rights reserved.
//

#import "ViewController.h"
#import "VierticalScrollView.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *dataTypeArray;
@property (nonatomic, strong) NSArray *dataTitleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

- (void)setUI{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"toutiao"]];
    imageV.frame = CGRectMake(0, 110, 70, 50);
    [self.view addSubview:imageV];
    self.dataTypeArray = @[@"类型1",@"类型2",@"类型3",@"类型4",@"类型5"];
    self.dataTitleArray = @[@"默认标题1",@"默认标题2",@"默认标题3",@"默认标题4",@"默认标题5"];
    VierticalScrollView *rollView = [[VierticalScrollView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageV.frame), 100, self.view.frame.size.width, 60)];
    [rollView setDataWithArray:self.dataTypeArray AndTitleArray:self.dataTitleArray];
    [self.view addSubview:rollView];
}

@end
