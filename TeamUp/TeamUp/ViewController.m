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

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
    self.emailText.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordText.borderStyle = UITextBorderStyleRoundedRect;
    self.enterEmailText.borderStyle = UITextBorderStyleRoundedRect;
    self.enterPasswordText.borderStyle = UITextBorderStyleRoundedRect;
    self.confirmPasswordText.borderStyle = UITextBorderStyleRoundedRect;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
