//
//  VierticalScrollView.m
//  CommunityApp
//
//  Created by AaronLee on 2017/10/12.
//  Copyright © 2017年 com.ebeitech. All rights reserved.
//

#import "VierticalScrollView.h"
#define ViewWidth self.bounds.size.width
#define ViewHeight self.bounds.size.height
#define OrangeColor [UIColor colorWithRed:254/255.0 green:97/255.0 blue:69/255.0 alpha:1.0]
//屏幕宽度和高度
#define Screen_Width [[UIScreen mainScreen] bounds].size.width
#define Screen_Height [[UIScreen mainScreen] bounds].size.height

@interface VierticalScrollView()<UIScrollViewDelegate>
@property(nonatomic,strong) NSMutableArray *titles; //标题
@property(nonatomic,strong) NSMutableArray *types;  //类型
@property(assign, nonatomic)int index;
@property(nonatomic,strong) UIView *firstView;
@property(nonatomic,strong) UILabel *firstBtn;
@property(nonatomic,strong) UILabel *firstLabel;
@property(nonatomic,strong) UILabel *firstBtn1;
@property(nonatomic,strong) UILabel *firstLabel1;
@property(nonatomic,strong) UILabel *firstBtn2;
@property(nonatomic,strong) UILabel *firstLable2;

@property(nonatomic,strong) UIView *secondView;
@property(nonatomic,strong) UILabel *secondBtn;
@property(nonatomic,strong) UILabel *secondLabel;
@property(nonatomic,strong) UILabel *secondBtn1;
@property(nonatomic,strong) UILabel *secondLabel1;
@property(nonatomic,strong) UILabel *secondBtn2;
@property(nonatomic,strong) UILabel *secondLabel2;
@end
@implementation VierticalScrollView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.index = 0;
        self.delegate = self;
        
        self.firstView.frame = CGRectMake(0, 0, Screen_Width, ViewHeight);
        self.firstBtn.frame = CGRectMake(0, ViewHeight/2-9, 48, 18);
        self.firstLabel.frame = CGRectMake(CGRectGetMaxX(self.firstBtn.frame)+2, ViewHeight/2-15, Screen_Width-140, 30);
        self.firstBtn1.frame = CGRectMake(0, 12, 48, 18);
        self.firstLabel1.frame = CGRectMake(CGRectGetMaxX(self.firstBtn1.frame)+2, 10, Screen_Width-140, 20);
        self.firstBtn2.frame = CGRectMake(0, CGRectGetMaxY(self.firstBtn1.frame)+5, 48, 18);
        self.firstLable2.frame = CGRectMake(CGRectGetMaxX(self.firstBtn2.frame)+2, CGRectGetMaxY(self.firstLabel1.frame)+5, Screen_Width-140, 20);
        
        self.secondView.frame = CGRectMake(0, ViewHeight, Screen_Width, ViewHeight);
        self.secondBtn.frame = CGRectMake(0, ViewHeight/2-9, 48, 18);
        self.secondLabel.frame = CGRectMake(CGRectGetMaxX(self.secondBtn.frame)+2, ViewHeight/2-15, Screen_Width-140, 30);
        self.secondBtn1.frame = CGRectMake(0, 12, 48, 18);
        self.secondLabel1.frame = CGRectMake(CGRectGetMaxX(self.secondBtn1.frame)+2, 10, Screen_Width-140, 20);
        self.secondBtn2.frame = CGRectMake(0, CGRectGetMaxY(self.secondBtn1.frame)+5, 48, 18);
        self.secondLabel2.frame = CGRectMake(CGRectGetMaxX(self.secondBtn2.frame)+2, CGRectGetMaxY(self.secondLabel1.frame)+5, Screen_Width-140, 20);
    }
    
    return self;
}

-(void)setDataWithArray:(NSArray *)typeArray AndTitleArray:(NSArray *)titleArray{
    
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray<NSArray *> *finalArray = [NSMutableArray arrayWithCapacity:0];
    
    [titleArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tmpArray addObject:obj];
        if ((idx +1) % 2 == 0) {
            [finalArray addObject:[NSArray arrayWithArray:tmpArray]];
            [tmpArray removeAllObjects];
        } else {
            if (idx == (titleArray.count - 1)) {
                [finalArray addObject:[NSArray arrayWithArray:tmpArray]];
                [tmpArray removeAllObjects];
            }
        }
    }];
    
    NSMutableArray *tmpArray2 = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray<NSArray *> *finalArray2 = [NSMutableArray arrayWithCapacity:0];
    
    [typeArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tmpArray2 addObject:obj];
        if ((idx +1) % 2 == 0) {
            [finalArray2 addObject:[NSArray arrayWithArray:tmpArray2]];
            [tmpArray2 removeAllObjects];
        } else {
            if (idx == (typeArray.count - 1)) {
                [finalArray2 addObject:[NSArray arrayWithArray:tmpArray2]];
                [tmpArray2 removeAllObjects];
            }
        }
    }];
    self.types = [NSMutableArray arrayWithArray:finalArray2];
    self.titles = [NSMutableArray arrayWithArray:finalArray];
    [self setDataWithIndex:self.index];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextView) userInfo:nil repeats:YES];
}

- (void)setDataWithIndex:(int)index{
    NSArray *array = [NSArray array];
    NSArray *typeArray = [NSArray array];
    if (index >= self.titles.count || index >= self.types.count) {
        self.index = 0;
        return;
    }else{
        array = self.titles[index];
        typeArray = self.types[index];
    }
    //根据单双数设置单行和双行Label的显示和隐藏
    if (array.count==1) {
        self.firstLabel.text = array[0];
        self.firstLabel.hidden = NO;
        self.firstLabel1.hidden = YES;
        self.firstLable2.hidden = YES;
    }else{
        self.firstLabel1.text = array[0];
        self.firstLable2.text = array[1];
        self.firstLabel1.hidden = NO;
        self.firstLable2.hidden = NO;
        self.firstLabel.hidden = YES;
    }
    if (typeArray.count == 1) {
        self.firstBtn.text = typeArray[0];
        self.firstBtn.hidden = NO;
        self.firstBtn1.hidden = YES;
        self.firstBtn2.hidden = YES;
    }else{
        self.firstBtn1.text = typeArray[0];
        self.firstBtn2.text = typeArray[1];
        self.firstBtn1.hidden = NO;
        self.firstBtn2.hidden = NO;
        self.firstBtn.hidden = YES;
    }
    NSArray *nextArray = nil;
    NSArray *nextTypeArray = nil;          //数组循环
    if (index==self.titles.count-1) {
        nextArray = self.titles[0];
    }else{
        nextArray = self.titles[index+1];
    }
    if (index==self.types.count-1) {
        nextTypeArray = self.types[0];
    }else{
        nextTypeArray = self.types[index+1];
    }
    if (nextArray.count==1) {
        self.secondLabel.text = nextArray[0];
        self.secondLabel.hidden = NO;
        self.secondLabel1.hidden = YES;
        self.secondLabel2.hidden = YES;
    }else{
        self.secondLabel1.text = nextArray[0];
        self.secondLabel2.text = nextArray[1];
        self.secondLabel1.hidden = NO;
        self.secondLabel2.hidden = NO;
        self.secondLabel.hidden = YES;
    }
    if (nextTypeArray.count==1) {
        self.secondBtn.text = nextTypeArray[0];
        self.secondBtn.hidden = NO;
        self.secondBtn1.hidden = YES;
        self.secondBtn2.hidden = YES;
    }else{
        self.secondBtn1.text = nextTypeArray[0];
        self.secondBtn2.text = nextTypeArray[1];
        self.secondBtn1.hidden = NO;
        self.secondBtn2.hidden = NO;
        self.secondBtn.hidden = YES;
    }
}

-(void)nextView{
    [self setContentOffset:CGPointMake(0, ViewHeight) animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y==ViewHeight) {
        
        if (self.index == self.titles.count-1) {
            self.index = 0;
        }else{
            self.index++;
        }
        [self setDataWithIndex:self.index];
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    
}

- (UIView *)firstView
{
    if (!_firstView) {
        _firstView = [[UIView alloc] init];
        _firstView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_firstView];
        [self.firstView addSubview:self.firstBtn];
        [self.firstView addSubview:self.firstLabel];
        [self.firstView addSubview:self.firstBtn1];
        [self.firstView addSubview:self.firstLabel1];
        [self.firstView addSubview:self.firstBtn2];
        [self.firstView addSubview:self.firstLable2];
    }
    return _firstView;
}

- (UILabel *)firstBtn
{
    if (!_firstBtn) {
        _firstBtn = [[UILabel alloc] init];
        _firstBtn.textAlignment = NSTextAlignmentCenter;
        _firstBtn.layer.borderWidth = 1.0;
        _firstBtn.layer.borderColor = OrangeColor.CGColor;
        _firstBtn.font = [UIFont systemFontOfSize:11];
        _firstBtn.layer.cornerRadius = 3.0;
        _firstBtn.textColor = OrangeColor;
    }
    return _firstBtn;
}

- (UILabel *)firstLabel
{
    if (!_firstLabel) {
        _firstLabel = [[UILabel alloc] init];
        _firstLabel.font = [UIFont systemFontOfSize:13.0];
        _firstLabel.textColor = [UIColor darkGrayColor];
    }
    return _firstLabel;
}

- (UILabel *)firstBtn1
{
    if (!_firstBtn1) {
        _firstBtn1 = [[UILabel alloc] init];
        _firstBtn1.layer.borderWidth = 1.0;
        _firstBtn1.textAlignment = NSTextAlignmentCenter;
        _firstBtn1.layer.borderColor = OrangeColor.CGColor;
        _firstBtn1.font = [UIFont systemFontOfSize:11];
        _firstBtn1.layer.cornerRadius = 3.0;
        _firstBtn1.textColor = OrangeColor;
    }
    return _firstBtn1;
}

- (UILabel *)firstLabel1
{
    if (!_firstLabel1) {
        _firstLabel1 = [[UILabel alloc] init];
        _firstLabel1.font = [UIFont systemFontOfSize:13.0];
        _firstLabel1.textColor = [UIColor darkGrayColor];
    }
    return _firstLabel1;
}

- (UILabel *)firstBtn2
{
    if (!_firstBtn2) {
        _firstBtn2 = [[UILabel alloc] init];
        _firstBtn2.layer.borderWidth = 1.0;
        _firstBtn2.layer.borderColor = OrangeColor.CGColor;
        _firstBtn2.font = [UIFont systemFontOfSize:11];
        _firstBtn2.textAlignment = NSTextAlignmentCenter;
        _firstBtn2.layer.cornerRadius = 3.0;
        _firstBtn2.textColor = OrangeColor;
    }
    return _firstBtn2;
}

- (UILabel *)firstLable2
{
    if (!_firstLable2) {
        _firstLable2 = [[UILabel alloc] init];
        _firstLable2.font = [UIFont systemFontOfSize:13.0];
        _firstLable2.textColor = [UIColor darkGrayColor];
    }
    return _firstLable2;
}

- (UIView *)secondView
{
    if (!_secondView) {
        _secondView = [[UIView alloc] init];
        _secondView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_secondView];
        [self.secondView addSubview:self.secondBtn];
        [self.secondView addSubview:self.secondLabel];
        [self.secondView addSubview:self.secondBtn1];
        [self.secondView addSubview:self.secondLabel1];
        [self.secondView addSubview:self.secondBtn2];
        [self.secondView addSubview:self.secondLabel2];
    }
    return _secondView;
}

- (UILabel *)secondBtn
{
    if (!_secondBtn) {
        _secondBtn = [[UILabel alloc] init];
        _secondBtn.layer.borderWidth = 1.0;
        _secondBtn.layer.borderColor = [UIColor redColor].CGColor;
        _secondBtn.font = [UIFont systemFontOfSize:11];
        _secondBtn.textAlignment = NSTextAlignmentCenter;
        _secondBtn.layer.cornerRadius = 3.0;
        _secondBtn.textColor =[UIColor redColor];
    }
    return _secondBtn;
}

- (UILabel *)secondLabel
{
    if (!_secondLabel) {
        _secondLabel = [[UILabel alloc] init];
        _secondLabel.font = [UIFont systemFontOfSize:13.0];
        _secondLabel.textColor = [UIColor darkGrayColor];
    }
    return _secondLabel;
}

- (UILabel *)secondBtn1
{
    if (!_secondBtn1) {
        _secondBtn1 = [[UILabel alloc] init];
        _secondBtn1.layer.borderWidth = 1.0;
        _secondBtn1.layer.borderColor = [UIColor redColor].CGColor;
        _secondBtn1.font = [UIFont systemFontOfSize:11];
        _secondBtn1.layer.cornerRadius = 3.0;
        _secondBtn1.textAlignment = NSTextAlignmentCenter;
        _secondBtn1.textColor = [UIColor redColor];
    }
    return _secondBtn1;
}

- (UILabel *)secondLabel1
{
    if (!_secondLabel1) {
        _secondLabel1 = [[UILabel alloc] init];
        _secondLabel1.font = [UIFont systemFontOfSize:13.0];
        _secondLabel1.textColor = [UIColor darkGrayColor];
    }
    return _secondLabel1;
}

- (UILabel *)secondBtn2
{
    if (!_secondBtn2) {
        _secondBtn2 = [[UILabel alloc] init];
        _secondBtn2.layer.borderWidth = 1.0;
        _secondBtn2.layer.borderColor = [UIColor redColor].CGColor;
        _secondBtn2.font = [UIFont systemFontOfSize:11];
        _secondBtn2.layer.cornerRadius = 3.0;
        _secondBtn2.textAlignment = NSTextAlignmentCenter;
        _secondBtn2.textColor = [UIColor redColor];
    }
    return _secondBtn2;
}

- (UILabel *)secondLabel2
{
    if (!_secondLabel2) {
        _secondLabel2 = [[UILabel alloc] init];
        _secondLabel2.font = [UIFont systemFontOfSize:13.0];
        _secondLabel2.textColor = [UIColor darkGrayColor];
    }
    return _secondLabel2;
}

@end
