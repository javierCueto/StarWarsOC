//
//  DetailFilmViewController.m
//  StarWarsOC
//
//  Created by Javier Cueto on 24/10/22.
//

#import "DetailFilmViewController.h"
#import "DetailFilmViewModel.h"

@interface DetailFilmViewController ()
@property (nonatomic, strong) DetailFilmViewModel* viewModel;
@property (nonatomic, strong) UIImageView *posterImage;
@property (nonatomic, strong) UIStackView *containerStack;
@property (nonatomic, strong) UILabel *descriptionTitleLabel;
@property (nonatomic, strong) UITextView *descriptionTextView;
@property (nonatomic, strong) UILabel *directorTitleLabel;
@property (nonatomic, strong) UILabel *directorLabel;
@property (nonatomic, strong) UIActivityIndicatorView* spinner;
@end

@implementation DetailFilmViewController

- (instancetype) initWithViewModel:(DetailFilmViewModel*) viewModel {
    self = [super init];
    _viewModel = viewModel;
    [_viewModel addObserver:self forKeyPath:@"status" options: NSKeyValueObservingOptionNew context:NULL];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [self.view addSubview:self.spinner];
    self.spinner.translatesAutoresizingMaskIntoConstraints = false;
    [self.spinner.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.spinner.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.spinner startAnimating];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configUIComponents];
    [self.viewModel viewDidLoad];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSNumber *statusNumber = [object valueForKey:@"status"];
            if (statusNumber.integerValue == success){
                [self configData];
                [self.spinner removeFromSuperview];
            }else {
                
            }
        });
        
    }
}

- (void) configUI {
    self.view.backgroundColor = [UIColor systemBackgroundColor];
}

- (void) configData {
    self.title = self.viewModel.getTitle;
    self.posterImage.image = [UIImage imageNamed:self.viewModel.getTitle];
    self.descriptionTextView.text = self.viewModel.getDescription;
    self.directorLabel.text = self.viewModel.getDirector;
}

- (void) configUIComponents {
    
    self.containerStack = [[UIStackView alloc] init];
    self.containerStack.translatesAutoresizingMaskIntoConstraints = false;
    self.containerStack.axis = UILayoutConstraintAxisVertical;
    self.containerStack.spacing = 15;
    [self.view addSubview:self.containerStack];
    [self.containerStack.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor ].active = YES;
    [self.containerStack.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor ].active = YES;
    [self.containerStack.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor  ].active = YES;
    
    
    
    self.posterImage = [[UIImageView alloc] init];
    self.posterImage.translatesAutoresizingMaskIntoConstraints = false;
    self.posterImage.contentMode = UIViewContentModeScaleToFill;
    self.posterImage.backgroundColor = [UIColor redColor];
    [self.posterImage.heightAnchor constraintEqualToConstant:200].active = true;
    self.posterImage.image = [UIImage imageNamed:@"starWars"];
    [self.containerStack addArrangedSubview:self.posterImage];
    
    self.descriptionTitleLabel = [[UILabel alloc] init];
    self.descriptionTitleLabel.text = @"Description";
    self.descriptionTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.descriptionTitleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [self.containerStack addArrangedSubview:self.descriptionTitleLabel];
    
    self.descriptionTextView = [[UITextView alloc] init];
    self.descriptionTextView.text = @"Jedi";
    self.descriptionTextView.textAlignment = NSTextAlignmentCenter;
    [self.descriptionTextView setFont:[UIFont systemFontOfSize:15]];
    [self.descriptionTextView.heightAnchor constraintEqualToConstant:200].active = true;
    [self.containerStack addArrangedSubview:self.descriptionTextView];
    
    self.directorTitleLabel = [[UILabel alloc] init];
    self.directorTitleLabel.text = @"Director";
    self.directorTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.directorTitleLabel setFont:[UIFont boldSystemFontOfSize:17]];
    [self.containerStack addArrangedSubview:self.directorTitleLabel];
    
    self.directorLabel = [[UILabel alloc] init];
    self.directorLabel.textAlignment = NSTextAlignmentCenter;
    [self.directorLabel setFont:[UIFont systemFontOfSize:15]];
    [self.containerStack addArrangedSubview:self.directorLabel];
}



@end
