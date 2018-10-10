//
//  CFNextViewController.m
//  CFPicGame
//
//  Created by chen on 2018/9/21.
//  Copyright © 2018年 chen. All rights reserved.
//

#import "CFNextViewController.h"

@interface CFNextViewController ()

@end

@implementation CFNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"下一页";
    self.view.backgroundColor = [UIColor purpleColor];
    NSLog(@"--我的名字-%@--我的性别%d---我的年龄%ld",self.titleString,self.gender,(long)self.age);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"learnSWIFT://"]];
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
