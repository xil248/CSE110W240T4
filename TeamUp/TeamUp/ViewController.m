//
//  ViewController.m
//  TeamUp
//
//  Created by Reno & Jenny on 1/26/16.
//  Copyright © 2016 CSE110W240T4. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UILabel *info;
UIButton *closeInfo;


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    self.emailText.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordText.borderStyle = UITextBorderStyleRoundedRect;
    self.enterEmailText.borderStyle = UITextBorderStyleRoundedRect;
    self.enterPasswordText.borderStyle = UITextBorderStyleRoundedRect;
    self.confirmPasswordText.borderStyle = UITextBorderStyleRoundedRect;
    self.groupNameText.borderStyle = UITextBorderStyleRoundedRect;
    self.maxPeopleText.borderStyle = UITextBorderStyleRoundedRect;
    
    //ckf nanshen
    // initiliaze the info label
    info = [[UILabel alloc] initWithFrame:CGRectMake(37, 166, 301, 280)];
    info.text = @"AAAA";
    info.backgroundColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:0.15];
    // initialze the closeinfo button
    closeInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)showGroupInfo:(id)sender {
    [self.view addSubview:closeInfo];
    [self.view addSubview:info];
    [closeInfo addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClicked {
    [info removeFromSuperview];
    [closeInfo removeFromSuperview];
}

@end
