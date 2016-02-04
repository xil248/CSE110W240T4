//
//  ViewController.m
//  TeamUp
//
//  Created by Reno & Jenny on 1/26/16.
//  Copyright © 2016 CSE110W240T4. All rights reserved.
//

#import "ViewController.h"
#import <Firebase/Firebase.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize emailText, passwordText, enterEmailText, enterPasswordText, confirmPasswordText, showInfo, groupNameText, maxPeopleText, resetPasswordText;

UILabel *info;
UIButton *closeInfo;
Firebase *firebase;
Firebase *users_ref;
Firebase *users;
UIStoryboard *mainstoryboard;
UIViewController *viewcontroller;
NSString *email;
NSString *uid; //store the valid cahracters of an email address (underscore _ , letters and numbers only)
NSString *name;
UIAlertAction* defaultAction;

- (void)viewDidLoad {
  [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.emailText.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordText.borderStyle = UITextBorderStyleRoundedRect;
    [self.passwordText setSecureTextEntry:YES];
    self.enterEmailText.borderStyle = UITextBorderStyleRoundedRect;
    self.enterPasswordText.borderStyle = UITextBorderStyleRoundedRect;
    [self.enterPasswordText setSecureTextEntry:YES];
    self.confirmPasswordText.borderStyle = UITextBorderStyleRoundedRect;
    [self.confirmPasswordText setSecureTextEntry:YES];
    self.groupNameText.borderStyle = UITextBorderStyleRoundedRect;
    self.maxPeopleText.borderStyle = UITextBorderStyleRoundedRect;
    
    //all initialization goes here
    
    defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}]; //initialize the default alertview action
    mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    firebase = [[Firebase alloc] initWithUrl:@"https://resplendent-inferno-8485.firebaseio.com"];
    users_ref = [firebase childByAppendingPath:@"users"];
    info = [[UILabel alloc] initWithFrame:CGRectMake(37, 166, 301, 280)];
    info.text = @"AAAA";
    info.backgroundColor = [UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:0.15];
    // initialze the closeinfo button
    closeInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    
    //initialization ends here
    //not run-time initialization
    NSDictionary *test = @{
                                    @"name" : @"test",
                                    @"email": @"test@ucsd.edu"
                                    };
    NSDictionary *jiz010 = @{
                               @"name" : @"jiasheng zhu",
                               @"email": @"jiz010@ucsd.edu"
                               };
    NSDictionary *users = @{
                            @"test_ucsdedu": test,
                            @"jiz010ucsdedu": jiz010
                            };
    [users_ref setValue: users];
    //end "not run-time initialization"

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

- (IBAction)signIn:(id)sender{
    [firebase authUser:emailText.text password:passwordText.text withCompletionBlock:^(NSError *error, FAuthData *authData) {
    if (error) {
        NSString *errorMessage = [error localizedDescription];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        email = emailText.text;
        uid = authData.uid;
        [self loadData];
        viewcontroller = [mainstoryboard instantiateViewControllerWithIdentifier:@"myGroupsViewController"];
        [self presentViewController:viewcontroller animated:YES completion:nil];
    }
    }];
    
}

- (IBAction)signUp:(id)sender{
    if(![enterPasswordText.text isEqualToString:confirmPasswordText.text]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Different passwords" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        enterPasswordText.text = @"";
        confirmPasswordText.text = @"";
        return;
    }
    else{
    [firebase createUser:enterEmailText.text password:enterPasswordText.text withValueCompletionBlock:^(NSError *error, NSDictionary *result) {
    if (error) {
        NSString *errorMessage = [error localizedDescription];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        email = enterEmailText.text;
        uid = firebase.authData.uid;
        [self loadData];
        viewcontroller = [mainstoryboard instantiateViewControllerWithIdentifier:@"myGroupsViewController"];
        [self presentViewController:viewcontroller animated:YES completion:nil];
        NSDictionary *user_info = @{
                                    @"name" : @"new user",
                                    @"email" : email
                                    };
        NSDictionary *new_user = @{uid : user_info};
        [users_ref updateChildValues:new_user];
    }
    }];
    }
    
}

- (IBAction)signOut:(id)sender{
    [firebase unauth];
}

- (IBAction)keyboardExit:(id)sender{} //dismiss keyboard


- (void) loadData{
    if(uid!=nil){
        users = [users_ref childByAppendingPath:uid];
        [users observeEventType:FEventTypeValue withBlock:^(FDataSnapshot *snapshot) {
            if(!snapshot.exists){
                NSLog(@"user info not found");
                return;
            }else{
            name = snapshot.value[@"name"];
            //do something
            }
        }];
    }
}



- (IBAction)resetPassword:(id)sender{
    [firebase resetPasswordForUser:resetPasswordText.text withCompletionBlock:^(NSError *error) {
        if (error) {
            NSLog(@"error when resetting password");
            [resetPasswordText setText:@"error occured"];
        } else {
            NSLog(@"succeed sending resetting password");
            [resetPasswordText setText:@"sent"];
        }
    }];
}

@end
