//
//  ListViewCell.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import "ListViewCell.h"



@interface ListViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@end


@implementation ListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
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
}

- (void)initComponentsIU{
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
}

- (void)updateData: (ListItem*) listItem {
    self.titleLabel.text = listItem.title;
}


@end
