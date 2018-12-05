//
//  EditTwoTableViewCell.m
//  JYPriceList
//
//  Created by jiangkuiquan on 2018/11/22.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "EditTwoTableViewCell.h"

@implementation EditTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 点击事件

- (IBAction)buttonClickAction:(UIButton *)sender {
    NSLog(@"点点点点点点点点点");
    
    
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.view = self;
//    [vc presentViewController:alert animated:YES completion:nil];
//
//    [self.window addSubview:vc.view];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
