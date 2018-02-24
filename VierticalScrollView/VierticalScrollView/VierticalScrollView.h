//
//  VierticalScrollView.h
//  CommunityApp
//
//  Created by AaronLee on 2017/10/12.
//  Copyright © 2017年 com.ebeitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VierticalScrollView : UIScrollView

-(instancetype)initWithFrame:(CGRect)frame;
-(void)setDataWithArray:(NSArray *)typeArray AndTitleArray:(NSArray *)titleArray;
@end
