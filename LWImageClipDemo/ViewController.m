//
//  ViewController.m
//  LWImageClipDemo
//
//  Created by leo on 15/9/28.
//  Copyright © 2015年 leo. All rights reserved.
//

#import "ViewController.h"
#import "LWImageTextCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    imageView.image = [UIImage imageNamed:@"gril0.jpg"];
//    [self.view addSubview:imageView];
//    imageView.backgroundColor = [UIColor orangeColor];
//    imageView.center = self.view.center;
    
//    [self.tableView reloadData];
//    self.tableView.hidden = YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *indentifier = @"Cell";
    LWImageTextCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell)
    {
        cell = [[LWImageTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    [cell reloadWithImageName:[NSString stringWithFormat:@"gril%d.jpg", (int)indexPath.row%4]];
    
    return cell;
}


@end
