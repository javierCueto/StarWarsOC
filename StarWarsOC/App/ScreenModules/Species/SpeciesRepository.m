//
//  SpeciesRepository.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 04/10/22.
//

#import "SpeciesRepository.h"
#import "ListItem.h"

@interface SpeciesRepository ()
@property (nonatomic, strong) ApiClient* apiClient;
@property (nonatomic, strong) NSString* url;
@end


@implementation SpeciesRepository
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
            ListItem *specie =  [[ListItem alloc] init];
            specie.title = obj[@"name"];
            specie.opening = obj[@"opening_crawl"];
            specie.director = obj[@"director"];
            specie.producer = obj[@"producer"];
            specie.releaseDate = obj[@"release_date"];
            specie.urlPath = obj[@"url"];
            [arrayData addObject:specie];

        }];
        fetchFilms(arrayData);
    }];
}

@end
