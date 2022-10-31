//
//  DetailFilmViewModel.m
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import "DetailFilmViewModel.h"
#import "FilmLoadDataUseCase.h"
#import "ListItem.h"


@interface DetailFilmViewModel ()
@property (nonatomic, strong) ListItem* film;
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
    [self.filmLoadDataUseCase getFilm:^(ListItem * film) {
        self.film = film;
        [self setStatus:success];
    }];
}

- (NSString*)getTitle {
    return self.film.title;
}

- (NSString*)getDescription {
    return self.film.opening;

}

- (NSString*)getDirector {
    return self.film.director;

}

- (NSString*)getProducer {
    return self.film.producer;
}
@end
