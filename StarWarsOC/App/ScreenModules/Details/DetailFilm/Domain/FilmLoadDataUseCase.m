//
//  FilmLoadDataUseCase.m
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import "FilmLoadDataUseCase.h"


@interface FilmLoadDataUseCase ()
@property (nonatomic, strong) DetailFilmRepository* filmRepository;
@end


@implementation FilmLoadDataUseCase


- (instancetype) initWithFilmRepository:(DetailFilmRepository*)filmRepository{
    self = [self init];
    if (self) {
        _filmRepository = filmRepository;
    }
    return  self;
}

- (void)getFilm: (void(^)(ListItem *film))getFilm {
    
    [self.filmRepository fetchData:^(ListItem * _Nonnull film) {
        getFilm(film);
    } ];

}
@end
