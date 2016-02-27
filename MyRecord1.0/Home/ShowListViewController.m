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
#import "UIView+Additions.h"
#import "ListViewCell.h"
#import "NSDate+AppAdditions.h"

@interface ShowListViewController ()

@property (nonatomic, strong) RecordModel *editingRecordModel;


//
@property (weak, nonatomic) IBOutlet UIView *detailContainerView;


//IBOutlets use for remark
@property (weak, nonatomic) IBOutlet UILabel *projectNameRemarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeRemarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeRemarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryRemarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionTimeRemarkLabel;


//IBOutlets need setValue
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *actionTimesLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;

//
@property (strong, nonatomic) NSTimer *currentTimeTimer;
@property (assign, nonatomic) BOOL isProgressing;
@property (assign, nonatomic) NSInteger duringTime;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;

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
    [self configDefault];
    [self refreshViewWithModel];
    // Do any additional setup after loading the view.
}

- (void)refreshViewWithModel
{
    NSArray *labels = @[self.detailContainerView,self.projectNameLabel,self.projectNameRemarkLabel,self.startTimeLabel,self.startTimeRemarkLabel,self.endTimeLabel,self.endTimeRemarkLabel,self.categoryLabel,self.categoryRemarkLabel,self.actionTimesLabel,self.actionTimeRemarkLabel];
    for (UIView *view in labels) {
        [view addAppBorders];
    }
}

- (void)configDefault
{
    self.isProgressing = NO;
    self.duringTime = 0;
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[ListViewCell alloc] initFromNib];
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
- (IBAction)statActivity:(id)sender {
    if (!self.isProgressing) {
        self.currentTimeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(resetCurrentTimeLabel) userInfo:nil repeats:YES];
        self.isProgressing = YES;
        self.startTime = [NSDate date];
    } else {
        [self stopActivity];
        self.isProgressing = NO;
    }
}

- (void)stopActivity
{
    [self.currentTimeTimer invalidate];
    [self finishActivity];
}

- (void)finishActivity
{
    self.currentTimeTimer = nil;
    self.duringTime = 0;
    self.currentTimeLabel.text = [NSDate timeformatFromSeconds:self.duringTime];
    self.endTime = [NSDate date];
    // dosth
    
}

- (void)resetCurrentTimeLabel
{
    self.duringTime += 1;
   
    self.currentTimeLabel.text = [NSDate timeformatFromSeconds:self.duringTime];
}

@end
