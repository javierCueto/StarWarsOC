//
//  MenuData.m
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 30/09/22.
//

#import "MenuData.h"

@implementation MenuData

- (instancetype) initWithTitle: (NSString *)title andUrl: (NSString *)url {

    self = [super init];

    if (self) {
        self.title = title;
        self.url = url;
    }
    return self;
}

@end

