//
//  FirstView.m
//  MyRecord1.0
//
//  Created by wzhnopc on 15/10/11.
//  Copyright © 2015年 wzhnopc. All rights reserved.
//

#import "FirstView.h"

@interface FirstView()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FirstView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.text = @"hello";
    }
    
    return cell;
}

@end
