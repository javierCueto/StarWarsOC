//
//  FilmLoadDataUseCase.h
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import <Foundation/Foundation.h>
#import "FilmRepository.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilmLoadDataUseCase : NSObject
- (instancetype) initWithFilmRepository:(FilmRepository*)filmRepository;
- (void)getFilm: (void(^)(NSMutableArray *arrayData))getFilm;
@end

NS_ASSUME_NONNULL_END
