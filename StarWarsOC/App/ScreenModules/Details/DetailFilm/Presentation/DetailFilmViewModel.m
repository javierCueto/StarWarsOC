//
//  DetailFilmViewModel.m
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import "DetailFilmViewModel.h"
#import "FilmLoadDataUseCase.h"


@interface DetailFilmViewModel ()
@property (nonatomic, strong) FilmLoadDataUseCase* filmLoadDataUseCase;
@end

@implementation DetailFilmViewModel

- (instancetype) initWithFilmLoadDataUseCase:(FilmLoadDataUseCase*)filmLoadDataUseCase {
    self = [self init];
    if (self) {
        _filmLoadDataUseCase = filmLoadDataUseCase;
    }
    return  self;
}

- (void)viewDidLoad {
    [self setStatus:loading];
    [self setStatus:success];
    [self.filmLoadDataUseCase getFilm:^(NSMutableArray * arrayData) {
        [self setStatus:success];
        self.arrayData = arrayData;
        [self setStatus:success];
    }];
}

- (NSString*)getTitle {
    return @"Star wars 1";
}

@end
