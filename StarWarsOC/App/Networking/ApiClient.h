//
//  ApiClient.h
//  StarWarsOC
//
//  Created by Jose Javier Cueto Mejia on 28/09/22.
//

#import <Foundation/Foundation.h>

@interface ApiClient : NSObject
@property (nonatomic, strong) NSURLSession *session;
- (void)request:(NSMutableURLRequest*)urlRequest completed:(void(^)(NSDictionary* responseDicctionary))completed;
- (instancetype) initWithSession:(NSURLSession*)session;
@end
