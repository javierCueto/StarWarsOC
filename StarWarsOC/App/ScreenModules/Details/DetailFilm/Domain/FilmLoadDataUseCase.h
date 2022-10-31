//
//  FilmLoadDataUseCase.h
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import <Foundation/Foundation.h>
#import "DetailFilmRepository.h"
#import "ListItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilmLoadDataUseCase : NSObject
- (instancetype) initWithFilmRepository:(DetailFilmRepository*)filmRepository;
- (void)getFilm: (void(^)(ListItem *film))getFilm;
@end

NS_ASSUME_NONNULL_END
