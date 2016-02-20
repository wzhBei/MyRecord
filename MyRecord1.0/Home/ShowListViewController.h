//
//  FirstViewController.h
//  MyRecord1.0
//
//  Created by wzhnopc on 15/10/11.
//  Copyright © 2015年 wzhnopc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordModel.h"

@interface ShowListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

- initWithRecordModel:(RecordModel *)recordModel;
@property (strong, nonatomic) IBOutlet UIView *aView;

@end
