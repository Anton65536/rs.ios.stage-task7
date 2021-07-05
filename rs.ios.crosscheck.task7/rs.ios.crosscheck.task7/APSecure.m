//
//  APSecure.m
//  rs.ios.crosscheck.task7
//
//  Created by Anton Petrash on 05/07/2021.
//

#import "APSecure.h"

@implementation APSecure

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer setCornerRadius:25];
    [self.layer setBorderWidth:1.5];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
}



- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
        self.backgroundColor = [[UIColor colorNamed:@"Little Boy Blue"] colorWithAlphaComponent:0.2];
    }
    else{
        self.backgroundColor = [UIColor whiteColor];
    }

}



@end
