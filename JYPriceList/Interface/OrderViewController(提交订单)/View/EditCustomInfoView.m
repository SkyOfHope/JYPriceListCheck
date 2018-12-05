//
//  EditCustomInfoView.m
//  JYPriceList
//
//  Created by jiangkuiquan on 2018/11/22.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "EditCustomInfoView.h"

#import "EditOneTableViewCell.h"
#import "EditTwoTableViewCell.h"

static NSString *const EditTwoTableViewCellID = @"EditTwoTableViewCellIdentiferi";
static NSString *const EditOneTableViewCellID = @"EditOneTableViewCellIdentifeir";
@interface EditCustomInfoView()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation EditCustomInfoView

-(instancetype)init{
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"EditCustomInfoView" owner:self options:nil].lastObject;
    }
    
    [self setUpUI];
    return self;
}

-(void)setUpUI{
    
    //(*为必填字段)
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc]initWithString:@"(*为必填字段)"];
    //找出特定字符在整个字符串中的位置
    NSRange redRange = NSMakeRange([[contentStr string] rangeOfString:@"*"].location, [[contentStr string] rangeOfString:@"*"].length);
    //修改特定字符的颜色
    [contentStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:redRange];
    //修改特定字符的字体大小
    [contentStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:redRange];
    [self.titleLabel setAttributedText:contentStr];
    
    self.tableView.alwaysBounceVertical = NO;
    //去除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"EditOneTableViewCell" bundle:nil] forCellReuseIdentifier:EditOneTableViewCellID];
    [self.tableView registerNib:[UINib nibWithNibName:@"EditTwoTableViewCell" bundle:nil] forCellReuseIdentifier:EditTwoTableViewCellID];
    
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


#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 ) {
        EditOneTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:EditOneTableViewCellID forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        EditTwoTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:EditTwoTableViewCellID forIndexPath:indexPath];
        NSArray *arr = @[@"手机号",@"年龄",@"出生日期",@"客户类型"];
        cell.namelab.text = arr[indexPath.row-1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 0)  {
        return 60;
    }
    return 120;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
