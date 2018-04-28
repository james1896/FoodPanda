//
//  ViewController.m
//  cakeDemo
//
//  Created by Toby on 2018/1/29.
//  Copyright © 2018年 Toby. All rights reserved.
//

#import "ViewController.h"
#import "CakeTableViewCell.h"
#import "CakeModel.h"
#import "CakeDetailedViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [self getData];
    
    UITableView *tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tabView];
    
}

- (NSArray *)getData{
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:0];
    for(int i=0;i<10;i++){
        CakeModel *model = [CakeModel new];
        model.urlStr = @"";
        model.categoryName = [NSString stringWithFormat:@"name:%d",i];
        model.categoryDesc = [NSString stringWithFormat:@"desc:%d",i];
        model.other = [NSString stringWithFormat:@"other:%d",i];
        [arr addObject:model];
    }
    return arr;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [[UIScreen mainScreen]bounds].size.height;
    //根据 iphone8比例
    return 0.352324*height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CakeTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"CakeTableViewCell" owner:nil options:nil]lastObject];
    
    CakeModel *model = self.dataArray[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:@""];
//    cell.name.text = model.name;
//    cell.desc.text = model.desc;
//    cell.other.text = model.other;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CakeDetailedViewController *controller = [[CakeDetailedViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
