
//
//  EditRefractionListView.m
//  JYPriceList
//
//  Created by jiangkuiquan on 2018/11/23.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "EditRefractionListView.h"

@implementation EditRefractionListView

-(instancetype)init{
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"EditRefractionListView" owner:self options:nil].lastObject;
    }
    
    return self;
}

//隐藏界面
-(void)hideControl{
    [UIView animateWithDuration:.3 animations:^{
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma mark - 点击事件
- (IBAction)buttonClickAction:(UIButton *)sender {
    [self hideControl];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
