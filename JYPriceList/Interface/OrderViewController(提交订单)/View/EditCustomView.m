//
//  EditCustomView.m
//  JYPriceList
//
//  Created by jiangkuiquan on 2018/11/28.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "EditCustomView.h"


static NSString *CellIdentifier = @"Cell";
@interface EditCustomView ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *dataBackView;
@property (weak, nonatomic) IBOutlet UIView *dataView;

@property (weak, nonatomic) IBOutlet UIView *customTypeBackView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *customTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *dataTextFielf;

@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, strong) NSString *dateStr;

@end

@implementation EditCustomView

-(instancetype)init{
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"EditCustomView" owner:self options:nil].lastObject;
        
    }
    [self setUpUI];
    [self buildDataView];
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
    
    // 注册cell和设置重用标识符
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    
    
}

-(void)buildDataView{
    self.dataView.backgroundColor = [UIColor redColor];
    
    // 1.日期Picker
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 400, 115)];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    // 1.1选择datePickr的显示风格
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    // 1.2查询所有可用的地区
    //NSLog(@"%@", [NSLocale availableLocaleIdentifiers]);
    // 1.3设置datePickr的地区语言, zh_Han后面是s的就为简体中文,zh_Han后面是t的就为繁体中文， zh_Hans_CN 简体中文 zh_Hant_CN 繁体中文 en_US 英文
    [self.datePicker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"]];
    // 1.4监听datePickr的数值变化
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    // 1.5 设置默认时间
    [self.datePicker setDate:[NSDate date]];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    self.dateStr = [formatter stringFromDate:self.datePicker.date];
    NSLog(@"%@",self.dateStr);
    
    [self.dataView addSubview:self.datePicker];
    
    
}


// 监听
- (void)dateChanged:(UIDatePicker *)picker{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    self.dateStr = [formatter stringFromDate:picker.date];
    NSLog(@"%@",self.dateStr);
}


//隐藏界面
-(void)hideControl{
    [UIView animateWithDuration:.3 animations:^{
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

#pragma mark - 点击事件

- (IBAction)sexButtonClickAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1:{
            NSLog(@"性别男性别男性别男性别男");
        }
            break;
        case 2:{
            NSLog(@"性别女性别女性别女性别女");
        }
            break;
            
        default:
            break;
    }
    
    
}


- (IBAction)buttonClickAction:(UIButton *)sender {
    switch (sender.tag) {
        case 3:{
            NSLog(@"选择日期选择日期选择日期");
            self.dataBackView.hidden =NO;
            self.customTypeBackView.hidden = YES;
        }
            break;
        case 4:{
            NSLog(@"选择类型选择类型选择类型");
            self.dataBackView.hidden = YES;
            self.customTypeBackView.hidden = NO;
        }
            break;
        case 5:{
            NSLog(@"点击取消点击取消点击取消");
            
            [self hideControl];
        }
            break;
        case 6:{
            NSLog(@"点击提交点击提交点击提交");
        }
            break;
            
            
        default:
            break;
    }
    
}

- (IBAction)dataButtonClickAction:(UIButton *)sender {
    switch (sender.tag) {
        case 7:{
            NSLog(@"返回返回返回返回返回");
            self.dataBackView.hidden = YES;
        }
            break;
        case 8:{
            NSLog(@"保存保存保存保存保存");
            self.dataTextFielf.text = self.dateStr;
            self.dataBackView.hidden = YES;
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)  {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *arr = @[@"转介绍",@"自然进店",@"微信",@"QQ"];
    cell.textLabel.text = arr[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *arr = @[@"转介绍",@"自然进店",@"微信",@"QQ"];
    self.customTypeTextField.text = arr[indexPath.row];
    self.customTypeBackView.hidden = YES;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
