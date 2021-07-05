//
//  APAuthorizeButton.m
//  rs.ios.crosscheck.task7
//
//  Created by Anton Petrash on 05/07/2021.
//

#import "APAuthorizeButton.h"

@implementation APAuthorizeButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setImage:[UIImage imageNamed:@"person"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"personfill"] forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [self.layer setBorderColor:[UIColor colorNamed:@"Little Boy Blue"].CGColor];
    [self.layer setBorderWidth:2];
    [self.layer setCornerRadius:10];
    self.clipsToBounds = YES;
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
