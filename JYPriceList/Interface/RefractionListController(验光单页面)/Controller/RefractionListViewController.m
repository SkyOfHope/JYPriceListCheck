

//
//  RefractionListViewController.m
//  JYPriceList
//
//  Created by jiangkuiquan on 2018/11/23.
//  Copyright © 2018年 jiangkuiquan. All rights reserved.
//

#import "RefractionListViewController.h"

#import "RefractionTableViewCell.h"


static NSString *const RefractionTableViewCellID = @"RefractionTableViewCellIdentifier";
@interface RefractionListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation RefractionListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setUpUI];
}

-(void)setUpUI{
    
    self.title = @"验光单";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical = NO;
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"RefractionTableViewCell" bundle:nil] forCellReuseIdentifier:RefractionTableViewCellID];
    
}

#pragma mark - UITableViewDragDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RefractionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:RefractionTableViewCellID forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 175;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
