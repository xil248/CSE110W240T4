//
//  ViewController.h
//  TeamUp
//
//  Created by Reno & Jenny on 1/26/16.
//  Copyright © 2016 CSE110W240T4. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *enterEmailText;
@property (weak, nonatomic) IBOutlet UITextField *enterPasswordText;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordText;
@property (weak, nonatomic) IBOutlet UIButton *showInfo;
@property (weak, nonatomic) IBOutlet UITextField *groupNameText;
@property (weak, nonatomic) IBOutlet UITextField *maxPeopleText;
@property (weak, nonatomic) IBOutlet UITextField *resetPasswordText;
@property (weak, nonatomic) IBOutlet UITextField *memberNameText;
@property (weak, nonatomic) IBOutlet UITextField *memberMajorText;
@property (weak, nonatomic) IBOutlet UITextField *memberYearText;
- (IBAction)showGroupInfo:(id)sender;
- (IBAction)signIn:(id)sender;
- (IBAction)signUp:(id)sender;
- (IBAction)resetPassword:(id)sender;
- (IBAction)signOut:(id)sender;
- (IBAction)memberInfoEditor:(id)sender;
@end

