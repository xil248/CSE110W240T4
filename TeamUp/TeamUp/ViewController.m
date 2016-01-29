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
    self.gsy.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
    //self.gsy.borderStyle = UITextBorderStyleRoundedRect;
   
    /* mess up
        self.view.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.6];
        self.popUpView.layer.cornerRadius = 5;
        self.popUpView.layer.shadowOpacity = 0.8;
        self.popUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
        [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.

  */
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
