//
//  APLoginVC.m
//  rs.ios.crosscheck.task7
//
//  Created by Anton Petrash on 05/07/2021.
//

#import "APLoginVC.h"
#import "APTextField.h"
#import "APAuthorizeButton.h"


@interface APLoginVC () <UITextFieldDelegate>

@property (weak, nonatomic)  IBOutlet APTextField *login;
@property (weak, nonatomic)  IBOutlet APTextField *password;
@property (weak, nonatomic)  IBOutlet APAuthorizeButton *authorize;
@property (weak, nonatomic)  IBOutlet UIView *secure;
@property (weak, nonatomic)  IBOutlet UILabel *result;

@end

@implementation APLoginVC


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.secure.layer setCornerRadius:10];
    [self.secure.layer setBorderWidth:2];
    [self.secure.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.secure setBackgroundColor:[UIColor whiteColor]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tap];
    [self.login setKeyboardType:UIKeyboardTypeASCIICapable];
    self.login.delegate    = self;
    
    self.password.delegate = self;
    [self.password setEnabled:NO];
    [self.password setSecureTextEntry:YES];
    [self.password setEnabled:YES];
    self.capcha = [NSMutableArray array];
    
}

- (IBAction)editingChanged:(APTextField *)sender {
    [sender setState:@"ready"];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return YES;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}


- (IBAction)authorizeButtonTapped:(id)sender {
    if ([self.password.text isEqualToString:@"password"] && [self.login.text isEqualToString:@"username"]) {
        [self.login setState:@"success"];
        [self.password setState:@"success"];
        [self.secure setHidden:NO];
        [self.authorize setEnabled:NO];
        [self.authorize setAlpha:0.5];
    } else {
        if (![self.login.text isEqualToString:@"username"]) {
            [self.login setState:@"error"];
        }
        if (![self.password.text isEqualToString:@"password"]) {
            [self.password setState:@"error"];
        }
    }
}




- (IBAction)secureButtonTapped:(UIButton *)sender {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* number = [formatter numberFromString:sender.titleLabel.text];
    [self.capcha addObject: number];
    
    if (self.capcha.count == 1) {
        [self.result setText:@" "];
    }
    
    [self.result setText:[self.result.text stringByAppendingFormat: @"%d ", number.intValue]];
    
    if (self.capcha.count == 3) {
        if ([self.capcha isEqualToArray:@[@1, @3, @2]]) {
            [self.secure.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
            [self presentAlertController];
        } else {
            [self.result setText:@"_"];
            [self.capcha removeAllObjects];
            [self.secure.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
        }
    } else {
        [self.secure.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

- (void)presentAlertController {
    UIAlertController *alertvc=[UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are succesfully authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *goBlank = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self refresh];
    }];
    [alertvc addAction:goBlank];
    [self presentViewController:alertvc animated:YES completion:nil];
}

- (void)refresh {
    [self.secure setHidden:YES];
    [self.password setState:@"ready"];
    [self.login setState:@"ready"];
    [self.password setText:@""];
    [self.login setText:@""];
    [self.capcha removeAllObjects];
    [self.authorize setEnabled:YES];
    [self.authorize setAlpha:1];
    [self.result setText:@"_"];
    [self.secure.layer setBorderColor:[UIColor clearColor].CGColor];
}

@end
