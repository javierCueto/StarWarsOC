//
//  MenuViewCell.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 28/09/22.
//

#import "MenuViewCell.h"

@interface MenuViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *logoImage;
@end

@implementation MenuViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self configureUI];
    return self;
}

- (void)configureUI {
    self.backgroundColor = [UIColor blackColor];
    [self configureConstraints];
}

- (void)configureConstraints {
    [self initComponentsIU];
    
    [self.titleLabel.topAnchor constraintEqualToAnchor: self.topAnchor constant:10].active = YES;
    [self.titleLabel.centerXAnchor constraintEqualToAnchor: self.centerXAnchor].active = YES;
    self.titleLabel.text = @"Jedi";
    self.titleLabel.textColor = [UIColor yellowColor];
    
    [self.logoImage.topAnchor constraintEqualToAnchor: self.titleLabel.bottomAnchor constant:10].active = YES;
    [self.logoImage.leadingAnchor constraintEqualToAnchor: self.leadingAnchor constant:10].active = YES;
    [self.logoImage.trailingAnchor constraintEqualToAnchor: self.trailingAnchor constant:-10].active = YES;
    [self.logoImage.bottomAnchor constraintEqualToAnchor: self.bottomAnchor constant:-10].active = YES;
    self.logoImage.image = [UIImage imageNamed:@"starWars"];
    self.logoImage.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

- (void)initComponentsIU{
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    self.logoImage = [[UIImageView alloc] init];
    self.logoImage.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.logoImage];
}

- (void)updateDataUIWithTitle: (NSString*) title {
    self.titleLabel.text = [title capitalizedString];
    self.logoImage.image = [UIImage imageNamed:title];
}

@end
