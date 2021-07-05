//
//  APTextField.m
//  rs.ios.crosscheck.task7
//
//  Created by Anton Petrash on 05/07/2021.
//

#import "APTextField.h"

@implementation APTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setBorderWidth:1.5];
    [self.layer setCornerRadius:5];
    [self setState:@"ready"];
}


- (void)setState:(NSString *)state {
    if ([state isEqualToString:@"ready"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Black Coral"].CGColor];
        [self setEnabled:YES];
        [self setAlpha:1];
    } else if ([state isEqualToString:@"success"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Turquoise Green"].CGColor];
        [self setEnabled:NO];
        [self setAlpha:0.5];
    } else if ([state isEqualToString:@"error"]) {
        [self.layer setBorderColor:[UIColor colorNamed:@"Venetian Red"].CGColor];
    } else {
        NSLog(@"Unknown state");
    }
}

@end
