//
//  ViewController.m
//  tomatoes
//
//  Created by Manmada Reddy Nallagonda on 2/3/15.
//  Copyright (c) 2015 Manmada Reddy Nallagonda. All rights reserved.
//

#import "ViewController.h"
#import "groupTableViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *groups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"https://groups.yahoo.com/api/v1/dir/categories/0/?start=20&intlCode=us&chrome=raw"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:queue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
                               id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               
                               
                               self.groups = object[@"ygData"][@"groups"];
                               [self.tableView reloadData];
                           }];

    self.tableView.dataSource = self;
    self.tableView.rowHeight =130;
    [self.tableView registerNib:[UINib nibWithNibName:@"groupTableViewCell" bundle:nil] forCellReuseIdentifier:@"groupTableViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    groupTableViewCell *groupCell = [tableView dequeueReusableCellWithIdentifier:@"groupTableViewCell"];
    
    NSDictionary *group = self.groups[indexPath.row];
    NSLog(@"%@",group);
        
    groupCell.groupName.text =group[@"name"];
    groupCell.groupDescription.text =group[@"desc"];
    return groupCell;
}
@end
