//
//  FirstViewController.m
//  MyRecord1.0
//
//  Created by wzhnopc on 15/10/11.
//  Copyright © 2015年 wzhnopc. All rights reserved.
//

/*
  1>初始化加载层级为1的Rcordmodel
  2>
 */

#import "ShowListViewController.h"

@interface ShowListViewController ()

@property (nonatomic, strong) RecordModel *editingRecordModel;

//IBOutlets


@end



@implementation ShowListViewController

- initWithRecordModel:(RecordModel *)recordModel
{
    self = [[ShowListViewController alloc] initWithNibName:@"ShowListViewController" bundle:nil];
    self.editingRecordModel = recordModel;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshViewWithModel];
    // Do any additional setup after loading the view.
}

- (void)refreshViewWithModel
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadNib
{
//    [[NSBundle mainBundle] loadNibNamed:@"TabShowListViewController" owner:self options:nil];
//    self.
}

#pragma mark - 
#pragma tableView DataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"hi";
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark -
#pragma tableView Delegate

- (void)tableView:tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    /*记载*/
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
