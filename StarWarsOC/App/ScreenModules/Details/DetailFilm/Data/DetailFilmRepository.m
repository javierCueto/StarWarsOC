//
//  FilmRepository.m
//  StarWarsOC
//
//  Created by Javier Cueto on 31/10/22.
//

#import "DetailFilmRepository.h"
#import "ApiClient.h"
#import "ListItem.h"

@interface DetailFilmRepository ()
@property (nonatomic, strong) ApiClient* apiClient;
@property (nonatomic, strong) NSString* url;
@end

@implementation DetailFilmRepository

- (instancetype) initWithApiClient:(ApiClient*)apiClient withURLPath:(nonnull NSString *)url {
    self = [self init];
    if (self) {
        _apiClient = apiClient;
        _url = url;
    }
    return  self;
}


- (void)fetchData:(void (^)(ListItem *))fetchFilms {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_url]];
    
    [self.apiClient request:urlRequest completed:^(NSDictionary *arrayData) {
        ListItem *film =  [[ListItem alloc] init];
        film.title = arrayData[@"title"];
        film.opening = arrayData[@"opening_crawl"];
        film.director = arrayData[@"director"];
        film.producer = arrayData[@"producer"];
        film.releaseDate = arrayData[@"release_date"];
        film.urlPath = arrayData[@"url"];
        NSLog(@"%@",film.title);
        fetchFilms(film);
    }];
    
}

@end
