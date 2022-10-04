//
//  FilmsRepository.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 03/10/22.
//

#import "FilmsRepository.h"
#import "ListItem.h"

@interface FilmsRepository ()
@property (nonatomic, strong) ApiClient* apiClient;
@property (nonatomic, strong) NSString* url;
@end


@implementation FilmsRepository
- (instancetype) initWithApiClient:(ApiClient*)apiClient withURLPath:(nonnull NSString *)url {
    self = [self init];
    if (self) {
        _apiClient = apiClient;
        _url = url;
    }
    return  self;
}


- (void)fetchData:(void (^)(NSMutableArray *))fetchFilms {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_url]];
    
    [self.apiClient request:urlRequest completed:^(NSDictionary *responseDicctionary) {
        NSMutableArray *arrayData =  [[NSMutableArray alloc] init];
        NSMutableArray *arrayResults =  [[NSMutableArray alloc] initWithArray:responseDicctionary[@"results"]];
        [arrayResults enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ListItem *film =  [[ListItem alloc] init];
            film.title = obj[@"title"];
            film.opening = obj[@"opening_crawl"];
            film.director = obj[@"director"];
            film.producer = obj[@"producer"];
            film.releaseDate = obj[@"release_date"];
            [arrayData addObject:film];

        }];
        fetchFilms(arrayData);
    }];

}
@end
