//
//  CLViewController.m
//  CLRouter
//
//  Created by Cflower8889 on 10/10/2018.
//  Copyright (c) 2018 Cflower8889. All rights reserved.
//

#import "CLViewController.h"
#import "CLRouter.h"
@interface CLViewController ()

@end

@implementation CLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"点击页面跳转";
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[CLRouter shareInstance] startModuleRouterName:@"router" path:@"jump" paramDict:@{@"titleString":@"chen",@"age":@30,@"gender":@1} block:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
