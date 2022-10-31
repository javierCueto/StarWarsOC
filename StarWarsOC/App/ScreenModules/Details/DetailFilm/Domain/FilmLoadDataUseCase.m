//
//  FilmLoadDataUseCase.m
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import "FilmLoadDataUseCase.h"


@interface FilmLoadDataUseCase ()
@property (nonatomic, strong) FilmRepository* filmRepository;
@end


@implementation FilmLoadDataUseCase


- (instancetype) initWithFilmRepository:(FilmRepository*)filmRepository{
    self = [self init];
    if (self) {
        _filmRepository = filmRepository;
    }
    return  self;
}

- (void)getFilm: (void(^)(NSMutableArray *arrayData))getFilm {
    
}
@end
