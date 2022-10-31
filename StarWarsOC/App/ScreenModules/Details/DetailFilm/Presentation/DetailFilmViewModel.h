//
//  DetailFilmViewModel.h
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import <Foundation/Foundation.h>
#import "StatusRequest.h"
#import "FilmLoadDataUseCase.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailFilmViewModel : NSObject
- (instancetype) initWithFilmLoadDataUseCase:(FilmLoadDataUseCase*)filmLoadDataUseCase;
@property (nonatomic, assign) StatusRequest status;
- (void)viewDidLoad;
@property (nonatomic, strong) NSMutableArray *arrayData;
- (NSString*)getTitle;
@end

NS_ASSUME_NONNULL_END
