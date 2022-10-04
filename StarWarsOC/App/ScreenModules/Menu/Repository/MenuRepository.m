//
//  MenuRepository.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 30/09/22.
//

#import "MenuRepository.h"
#import "ApiClient.h"
#import "MenuData.h"

@interface MenuRepository ()
@property (nonatomic, strong) ApiClient* apiClient;
@end


@implementation MenuRepository

- (instancetype) initWithApiClient:(ApiClient*)apiClient {
    self = [self init];
    if (self) {
        _apiClient = apiClient;
    }
    return  self;
}

- (void)fetchMenu: (void(^)(NSMutableArray *arrayData))fetchMenu {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://swapi.dev/api/"]];
    
    [self.apiClient request:urlRequest completed:^(NSDictionary *responseDicctionary) {
        NSMutableArray *arrayMenu =  [[NSMutableArray alloc] init];
        [responseDicctionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
            MenuData *menuData =  [[MenuData alloc] initWithTitle:key andUrl:value];
            [arrayMenu addObject:menuData];
            
        }];
        fetchMenu(arrayMenu);
    }];

}

@end
