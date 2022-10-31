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
@end

@implementation DetailFilmViewController

- (instancetype) initWithViewModel:(DetailFilmViewModel*) viewModel {
    self = [super init];
    _viewModel = viewModel;
    [_viewModel addObserver:self forKeyPath:@"status" options: NSKeyValueObservingOptionNew context:NULL];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configConstraints];
    [self.viewModel viewDidLoad];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSNumber *statusNumber = [object valueForKey:@"status"];
            if (statusNumber.integerValue == success){
                [self configData];
            }else {
                
            }
        });
        
    }
}

- (void) configUI {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) configData {
    self.title = self.viewModel.getTitle;
    self.posterImage.image = [UIImage imageNamed:self.viewModel.getTitle];
}

- (void) configConstraints {
    self.posterImage = [[UIImageView alloc] init];
    self.posterImage.translatesAutoresizingMaskIntoConstraints = false;
    self.posterImage.contentMode = UIViewContentModeScaleToFill;
    self.posterImage.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.posterImage];
    [self.posterImage.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor ].active = YES;
    [self.posterImage.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor ].active = YES;
    [self.posterImage.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor  ].active = YES;
    [self.posterImage.heightAnchor constraintEqualToConstant:200].active = true;
    self.posterImage.image = [UIImage imageNamed:@"starWars"];
}



@end
