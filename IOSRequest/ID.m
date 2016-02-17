//
//  ID.m
//  IOSRequest
//
//  Created by Apple on 2/11/16.
//  Copyright © 2016 AMOSC. All rights reserved.
//

#import "ID.h"

@interface ID ()
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

@end

@implementation ID

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.idLabel.text = self.id;
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
