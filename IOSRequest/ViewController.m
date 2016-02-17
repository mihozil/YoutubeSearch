//
//  ViewController.m
//  IOSRequest
//
//  Created by Apple on 2/7/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import "ViewController.h"
#import "IOSRequest.h"
#import "ID.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtField;
@property (weak, nonatomic) IBOutlet UITableView *tableField;

@end

@implementation ViewController{
    NSArray *dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableField.delegate = self;
    self.tableField.dataSource = self;
    self.txtField.delegate = self;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary*item = dataArray[indexPath.row];
    NSDictionary*snippet = item[@"snippet"];
    
    cell.textLabel.text = snippet[@"title"];
    NSURL *urlImg = [NSURL URLWithString:snippet[@"thumbnails"][@"default"][@"url"]];
    NSData *dataImg = [NSData dataWithContentsOfURL:urlImg];
    
    cell.imageView.image = [UIImage imageWithData:dataImg];
    cell.detailTextLabel.text = item[@"id"][@"videoId"];
    return cell;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *keyword = self.txtField.text;
    dataArray = nil;
    [IOSRequest search:keyword onCompletionHandle:^(NSDictionary*JsonData){
        dispatch_async(dispatch_get_main_queue(), ^{
             NSLog(@"JSONDATA: %@",JsonData);
            dataArray = JsonData[@"items"];
            [self.tableField reloadData];
        });
    
        
    }];
    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ID"]){
        NSIndexPath  *indexPath = [self.tableField indexPathForSelectedRow];
        NSDictionary*item = dataArray[indexPath.row];
        
        ID *savedId = [segue destinationViewController];
        savedId.id = item[@"id"][@"videoId"];
    }
  
    
}


@end
